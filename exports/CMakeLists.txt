include(CMakePackageConfigHelpers)

#
# Config
#
configure_package_config_file(LibraryConfig.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION setup
	)

#
# Targets
#
install(
	EXPORT Targets
	FILE ${PROJECT_NAME}Targets.cmake
	NAMESPACE ${PROJECT_PREFIX}::
	DESTINATION setup
	)

install(
	FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	DESTINATION setup
	)