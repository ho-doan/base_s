import 'dart:ffi' as ffi;
import 'dart:io' show Platform, Directory;

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();
typedef HelloName = void Function(String);

class MysqlHD {
  MysqlHD() {
    var libraryPath =
        path.join(Directory.current.path, 'mysql_hd', 'libmysql_hd.so');

    if (Platform.isMacOS) {
      libraryPath =
          path.join(Directory.current.path, 'mysql_hd', 'libmysql_hd.dylib');
    }

    if (Platform.isWindows) {
      libraryPath = path.join(
          Directory.current.path, 'mysql_hd', 'Debug', 'mysql_hd.dll');
    }

    final dylib = ffi.DynamicLibrary.open(libraryPath);

    hello = dylib
        .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
        .asFunction();

    helloName = dylib.lookupFunction<ffi.Void Function(ffi.Pointer<ffi.Uint8>),
        void Function(String)>('hello_name');
  }
  late HelloName helloName;
  late HelloWorld hello;
}

void main() {
  // Open the dynamic library
  var libraryPath =
      path.join(Directory.current.path, 'mysql_hd', 'libmysql_hd.so');

  if (Platform.isMacOS) {
    libraryPath =
        path.join(Directory.current.path, 'mysql_hd', 'libmysql_hd.dylib');
  }

  if (Platform.isWindows) {
    libraryPath =
        path.join(Directory.current.path, 'mysql_hd', 'Debug', 'mysql_hd.dll');
  }

  final dylib = ffi.DynamicLibrary.open(libraryPath);

  // Look up the C function 'hello_world'
  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<HelloWorldFunc>>('hello_world')
      .asFunction();
  // Call the function
  hello();
}
