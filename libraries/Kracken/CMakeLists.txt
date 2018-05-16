enable_language ( Fortran )


add_library(Kracken STATIC
	source/M_kracken.F90
	)

add_library(${PROJECT_PREFIX}::Kracken ALIAS Kracken)
	
target_include_directories(Kracken
	PRIVATE
		source
	PUBLIC
		$<BUILD_INTERFACE:${CMAKE_BINARY_DIR}/include>
		$<INSTALL_INTERFACE:include>
	)



set_target_properties(Kracken PROPERTIES
	FOLDER libraries
	OUTPUT_NAME ${PROJECT_PREFIX}-Kracken
	Fortran_MODULE_DIRECTORY ${CMAKE_BINARY_DIR}/include
)


install(TARGETS Kracken
	EXPORT Targets
	LIBRARY DESTINATION lib
	ARCHIVE DESTINATION lib
)

install ( DIRECTORY "${CMAKE_BINARY_DIR}/include/" DESTINATION  include )