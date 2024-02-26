import { Uri, window } from "vscode";
import * as changeCase from "change-case";
import { createDirectory, createFile, promptForName, promptForTargetDirectory } from "../utils/utils";
import * as _ from "lodash";
import { lstatSync } from "fs";

export const newResource = async (uri: Uri) => {
    let file = uri.path.split("/").slice(-1)[0];
    let resName = await promptForName(changeCase.snakeCase(file));
    if (_.isNil(resName) || resName.trim() === "") {
        window.showErrorMessage("the page name must not be empty");
        return;
    }
    let fsPath;
    if (_.isNil(_.get(uri, "fsPath")) || !lstatSync(uri.fsPath).isDirectory()) {
        fsPath = await promptForTargetDirectory();
        if (_.isNil(fsPath)) {
            window.showErrorMessage("Please select a valid directory");
            return;
        }
    } else {
        fsPath = uri.fsPath;
    }
    await genRes(changeCase.snakeCase(resName), fsPath);
};

export const genRes = async (resName: string, fsPath: string) => {
    //#region create model local
    await createDirectory(`${fsPath}/lib/data/models/local/${resName}`);
    createFile(`lib/data/models/local/${resName}/i_${resName}_local.dart`, fsPath, _resIModelLocal(resName));
    createFile(`lib/data/models/local/${resName}/${resName}_local.dart`, fsPath, _resModelLocal(resName));
    createFile(`lib/data/models/local/${resName}/${resName}_local_stub.dart`, fsPath, _resModelLocalStub(resName));
    //#endregion
    //#region create model remote
    await createDirectory(`${fsPath}/lib/data/models/remote/${resName}`);
    createFile(`lib/data/models/remote/${resName}/i_${resName}_local.dart`, fsPath, _resModelRemote(resName));
    //#endregion
    //#region create local data source
    await createDirectory(`${fsPath}/lib/data/local_data_sources/${resName}`);
    createFile(`lib/data/local_data_sources/${resName}/${resName}_local_data_source.dart`, fsPath, _resLocalDataSource(resName));
    createFile(`lib/data/local_data_sources/${resName}/${resName}_local_data_source_stub.dart`, fsPath, _resLocalDataSourceStub(resName));
    //#endregion
    //#region create remote data source
    await createDirectory(`${fsPath}/lib/data/remote_data_sources/${resName}`);
    createFile(`lib/data/remote_data_sources/${resName}/${resName}_remote_data_source.dart`, fsPath, _resRemoteDataSource(resName));
    //#endregion
    //#region create models
    createFile(`lib/models/${resName}_model.dart`, fsPath, _resModels(resName));
    //#endregion
    //#region create repository
    await createDirectory(`${fsPath}/lib/repositories/${resName}`);
    createFile(`lib/repositories/${resName}/${resName}_repository.dart`, fsPath, _resRemoteDataSource(resName));
    //#endregion
    //#region create use case
    await createDirectory(`${fsPath}/lib/use_cases/${resName}`);
    createFile(`lib/use_cases/${resName}/${resName}_use_case.dart`, fsPath, _resUseCase(resName));
    //#endregion
};

// wel_come
export const _resIModelLocal = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `// TODO(created): rewrite file local.dart \`export '${name}/${name}_local.dart' if (dart.library.js) '${name}/${name}_local_stub.dart';\`
abstract class I${className}Local {
\tconst I${className}Local({
\t\tthis.id,
\t});

\tfinal int? id;
}
`;
};

// wel_come
export const _resModelRemote = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `// TODO(created): remote.dart \`export '${name}.dart';\`
import 'package:freezed_annotation/freezed_annotation.dart';

import '../local/local.dart';

part '${name}.freezed.dart';
part '${name}.g.dart';

@Freezed(unionKey: 'type', unionValueCase: FreezedUnionCase.pascal)
class ${className}Remote with _$${className}Remote {
\tconst factory ${className}Remote({
\t\t@JsonKey(name: 'id') int? id,
\t}) = _${className}Remote;

\tfactory ${className}Remote.fromJson(Map<String, dynamic> json) =>
\t\t_$${className}RemoteFromJson(json);

\tfactory ${className}Remote.fromEntryLocal(${className}Local model) => ${className}Remote(
\t\tid: model.id,
\t\t);
}   
`;
};

// wel_come
export const _resModelLocal = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../../models.dart';
import 'i_${name}_local.dart';

part '${name}_local.g.dart';

@CopyWith()
@collection
class ${className}Local extends I${className}Local{
\tconst ${className}Local({
\t\tsuper.id,
\t\tthis.key = Isar.autoIncrement,
\t});
\tfactory ${className}Local.fromRemote(${className}Remote model) => ${className}Local(
\t\tid: model.id,
\t);

\tfinal Id? key;
}
`;
};

// wel_come
export const _resLocalDataSource = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);
    // welCome
    let nameGen = changeCase.camelCase(name);

    return `import 'dart:developer';

\timport 'package:isar/isar.dart';

\timport '../../../services/local_database/local_database.dart';
\timport '../../models/models.dart';

// TODO(created): domain/../service_locator.dart -> ..registerFactory<${className}LocalDataSource>(${className}LocalDataSource.new)
// TODO(created): local_data_sources.dart.dart -> export '${name}/${name}_local_data_source.dart' if (dart.library.js) '${name}/${name}_local_data_source_stub.dart';

\tclass ${className}LocalDataSource extends BaseLocalDatabase<${className}Local>
\t\twith LocalDatabase {
\t@override
\tFuture<List<${className}Local>> getAll([Isar? isar]) {
\t\tif (isar != null) {
\t\t\treturn isar.${nameGen}Locals.where().findAll();
\t\t}
\t\tif (instance != null) {
\t\t\treturn instance!.${nameGen}Locals.where().findAll();
\t\t}
\t\tthrow Exception('isar null');
\t}

\t@override
\tFuture<${className}Local?> getByKey(Id id) {
\t\tif (instance == null) throw Exception('isar null');
\t\treturn instance!.${nameGen}Locals.filter().keyEqualTo(id).findFirst();
\t}

\t@override
\tFuture<Id> insert(${className}Local model) {
\t\tif (instance == null) throw Exception('isar null');
\t\treturn instance!.writeTxn<Id>(() => instance!.${nameGen}Locals.put(model));
\t}

\t@override
\tFuture<bool> insertAll(List<${className}Local> models, [Isar? isar]) async {
\t\ttry {
\t\t\tif (isar != null) {
\t\t\tawait isar.writeTxn<List<Id>>(
\t\t\t\t() => isar.${nameGen}Locals.putAll(models),
\t\t\t);
\t\t\treturn true;
\t\t\t}
\t\t\tif (instance != null) {
\t\t\tawait instance!.writeTxn<List<Id>>(
\t\t\t\t() => instance!.${nameGen}Locals.putAll(models),
\t\t\t);
\t\t\treturn true;
\t\t\t}
\t\t} on Exception catch (e) {
\t\t\tlog('insert all ${className} local error: $e');
\t\t\treturn false;
\t\t}
\t\tthrow Exception('isar null');
\t}

\t@override
\tFuture<bool> delete(int id) {
\t\tif (instance == null) throw Exception('isar null');
\t\treturn instance!.writeTxn<bool>(() => instance!.${nameGen}Locals.delete(id));
\t}
}    
`;
};

export const _resLocalDataSourceStub = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import '../../../services/local_database/local_database.dart';
\timport '../../models/models.dart';
\tclass ${className}LocalDataSource extends BaseLocalDatabase<${className}Local>
\t\twith LocalDatabase {}  
`;
};

export const _resRemoteDataSource = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../services/networks/api_client.dart';
import '../../models/models.dart';
    
// TODO(created): remote_data_sources.dart: export '${name}/${name}_remote_data_source.dart';
// TODO(created): api_client.dart: @GET('/${name}') Future<BaseModel<${className}Remote>>  ${className}GetAll();

class ${className}RemoteDataSource {
\tconst ${className}RemoteDataSource(this._apiClient);
    
\tfinal ApiClient _apiClient;

\tFuture<Either<ErrorState, List<${className}Remote>>> fetch() async {
\t\ttry {
\t\t\tfinal result = await _apiClient.${className}GetAll();
\t\t\tassert(result.list != null, '${className} get all remote model server null');
\t\t\treturn Right(result.list!);
\t\t} on Exception catch (error, stackTrace) {
\t\t\tlog('${className} get all failed: $error', stackTrace: stackTrace);
\t\t\treturn Left(
\t\t\t\tErrorState(
\t\t\t\t\terror: error,
\t\t\t\t\ttype: ErrorType.server,
\t\t\t\t\tstackTrace: stackTrace,
\t\t\t\t),
\t\t\t);
\t\t}
\t}
}      
`;
};

export const _resRepository = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

import '../../data/local_data_sources/local_data_sources.dart';
import '../../data/remote_data_sources/remote_data_sources.dart';
import '../../domain.dart';

// TODO(created): repositories.dart -> export '${name}/${name}_repository.dart';

class ${className}Repository {
\t${className}Repository(this._local, this._remote);

\tfinal ${className}LocalDataSource _local;
\tfinal ${className}RemoteDataSource _remote;

\tFuture<Either<ErrorState, List<${className}Model>>> fetch({
\tbool forceRefresh = false,
\tRootIsolateToken? token,
\t}) async {
\ttry {
\t\tList<${className}Local> cache;
\t\tif (token == null) {
\t\tcache = await _local.getAll();
\t\t} else {
\t\tcache = await _local.getAllTask(token);
\t\t}

\t\tfinal check = forceRefresh || cache.isEmpty;

\t\tif (check) {
\t\tfinal fetchResult = await _remote.fetch();
\t\treturn fetchResult.fold(Left.new, (r) async {
\t\t\tfinal models = [
\t\t\tfor (final i in r) ${className}Local.fromRemote(i),
\t\t\t];
\t\t\tunawaited(
\t\t\tcomputeApp(
\t\t\t\t_local.insertAllTask,
\t\t\t\tLocalTaskList(
\t\t\t\tmodels: models,
\t\t\t\ttoken: !kIsWeb ? token ?? RootIsolateToken.instance! : null,
\t\t\t\t),
\t\t\t),
\t\t\t);
\t\t\treturn Right(
\t\t\t[for (final i in r) ${className}Model.fromRemote(i)],
\t\t\t);
\t\t});
\t\t}

\t\treturn Right([for (final i in cache) ${className}Model.fromLocal(i)]);
\t} on Exception catch (error, stackTrace) {
\t\tlog(
\t\t'Fetch all ${className} info list failed: $error',
\t\tstackTrace: stackTrace,
\t\t);
\t\treturn Left(ErrorState(error: error, stackTrace: stackTrace));
\t}
\t}
}        
`;
};

export const _resUseCase = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';

import '../../data/models/models.dart';
import '../../models/models.dart';
import '../../repositories/repositories.dart';

// TODO(created): use_cases.dart -> export '${name}/${name}_use_case.dart';

class ${className}UseCase {
\t${className}UseCase(this._repository);

\tfinal ${className}Repository _repository;

\tFuture<Either<ErrorState, List<${className}Model>>> fetch({
\tbool forceRefresh = false,
\tRootIsolateToken? token,
\t}) =>
\t\t_repository.fetch(forceRefresh: forceRefresh, token: token);
}        
`;
};

export const _resModels = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/models.dart';

part '${name}_model.freezed.dart';

// TODO(created): models.dart -> export '${name}_model.dart';

@Freezed(
\tunionKey: 'type',
\tunionValueCase: FreezedUnionCase.pascal,
\tfromJson: false,
\ttoJson: false,
)
class ${className}Model with _$${className}Model {
\tconst factory ${className}Model({
\t\tint? id,
\t\tString? name,
\t}) = _${className}Model;

\tfactory ${className}Model.fromLocal(${className}Local model) => ${className}Model(
\t\tid: model.id,
\t\tname: model.name,
\t);
\tfactory ${className}Model.fromRemote(${className}Remote model) => ${className}Model(
\t\tid: model.id,
\t\tname: model.name,
\t);
}

extension ${className}ModelX on ${className}Model {}    
`;
};

// wel_come
export const _resModelLocalStub = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import '../../models.dart';
import 'i_${name}_local.dart';

class ${className}Local extends I${className}Local{
\tconst ${className}Local({
\t\tsuper.id,
\t\tthis.key,
\t});
\tfactory ${className}Local.fromRemote(${className}Remote model) => ${className}Local(
\t\tid: model.id,
\t);

\tfinal int? key;
}
`;
};