enable_language ( Fortran )


add_library(kracken STATIC
	source/M_kracken.F90
	)

add_library(${PROJECT_PREFIX}::kracken ALIAS kracken)
	
target_include_directories(kracken
	PRIVATE
		source
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include>
		$<INSTALL_INTERFACE:include>
	)



set_target_properties(kracken PROPERTIES
	FOLDER libraries
	OUTPUT_NAME ${PROJECT_PREFIX}-kracken
	Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include
)


install(TARGETS kracken
	EXPORT Targets
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install ( DIRECTORY "${CMAKE_BINARY_DIR}/include/" DESTINATION  include )