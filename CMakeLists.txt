project(PineScope)
cmake_minimum_required(VERSION 3.10)

find_package(PkgConfig REQUIRED)
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

add_executable(hello main.c)
target_link_libraries(hello PRIVATE ${GTK3_LIBRARIES})
message(${GTK3_CFLAGS_OTHER})
# target_compile_definitions(hello PRIVATE ${GTK3_CFLAGS_OTHER})
target_include_directories(hello PRIVATE ${GTK3_INCLUDE_DIRS})
target_link_directories(hello PRIVATE ${GTK3_LIBRARY_DIRS})
