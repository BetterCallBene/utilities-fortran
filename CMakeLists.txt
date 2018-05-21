#
# Project
#
#!!! NOTE: Put name of the library here. Should match the directory name
project(utilitiesfortran)
set(PROJECT_PREFIX "util")
#!!! set(EXPORT_PREFIX "swcwrap")
#!!! string(TOLOWER "${EXPORT_PREFIX}_" TARGET_PREFIX)
cmake_minimum_required(VERSION 3.5)

#
# Support Conan.io
#
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

#
# Setup testing
#
include (CTest)

#
# 3rdParty: boost
#
# !!! NOTE: Optional Dependencies like "boost"
#find_package(Boost REQUIED COMPONENTS chrono)

#
# exports
#
add_subdirectory(exports)

#
# libraries
#
add_subdirectory(libraries)


#
# tests
#
add_subdirectory(tests)

#
# install
#
install(
	FILES README.md
	DESTINATION .
	)
