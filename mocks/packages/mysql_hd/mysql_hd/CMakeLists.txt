cmake_minimum_required(VERSION 3.7 FATAL_ERROR)
project(mysql_hd VERSION 1.0.0 LANGUAGES C)
add_library(mysql_hd SHARED mysql_hd.c mysql_hd.def)
add_executable(hello_test mysql_hd.c)

set_target_properties(mysql_hd PROPERTIES
    PUBLIC_HEADER mysql_hd.h
    VERSION ${PROJECT_VERSION}
    SOVERSION 1
    OUTPUT_NAME "mysql_hd"
    XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "Hex_Identity_ID_Goes_Here"
)