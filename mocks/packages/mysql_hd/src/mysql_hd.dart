import 'dart:ffi' as ffi;
import 'dart:ffi' ;
import 'dart:io' show Platform, Directory;

import 'package:ffi/ffi.dart';
import 'package:path/path.dart' as path;

import '../generated_bindings.dart';

// FFI signature of the hello_world C function
typedef HelloWorldFunc = ffi.Void Function();
typedef HelloWorld = void Function();
typedef HelloName = void Function(String);

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

  final naLib = NativeLibrary(dylib);

  naLib.hello_world();
  naLib.hello_name("name".to)
}
