import { Uri, window } from "vscode";
import * as changeCase from "change-case";
import { createFile, promptForName, promptForTargetDirectory } from "../utils/utils";
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
}

export const genRes = async (resName: string, fsPath: string) => {
    createFile(`lib/data/models/local/${resName}_local.dart`, fsPath, _resModelLocal(resName));
    createFile(`lib/data/models/local/${resName}_local_stub.dart`, fsPath, _resModelLocalStub(resName));
};

// wel_come
export const _resModelLocal = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:isar/isar.dart';

import '../models.dart';

part '${name}_local.g.dart';

@CopyWith()
@collection
class ${className}Local {
    const ${className}Local({
    this.id,
    this.key = Isar.autoIncrement,
    });
    factory ${className}Local.fromRemote(${className}Remote model) => ${className}Local(
        id: model.id,
        );

    final Id? key;

    final int? id;
}
    `;
};
// wel_come
export const _resModelLocalStub = (name: string) => {
    // WelCome
    let className = changeCase.pascalCase(name);

    return `import '../models.dart';

class ${className}Local {
    const ${className}Local({
    this.id,
    });
    factory ${className}Local.fromRemote(${className}Remote model) => ${className}Local(
        id: model.id,
        );

    final int? id;
}
    `;
};