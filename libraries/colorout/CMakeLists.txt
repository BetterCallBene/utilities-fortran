enable_language ( Fortran )


add_library(colorout STATIC
	source/colorout.F90
	)

add_library(${PROJECT_PREFIX}::colorout ALIAS colorout)
	
target_include_directories(colorout
	PRIVATE
		source
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include>
		$<INSTALL_INTERFACE:include>
	)



set_target_properties(colorout PROPERTIES
	FOLDER libraries
	OUTPUT_NAME ${PROJECT_PREFIX}-colorout
	Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include
)


install(TARGETS colorout
	EXPORT Targets
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install ( DIRECTORY "${CMAKE_BINARY_DIR}/include/" DESTINATION  include )