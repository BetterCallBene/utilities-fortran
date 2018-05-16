enable_language ( Fortran )
add_executable(unit_tests
	krackentest.F90
)
target_link_libraries(unit_tests
		Kracken
)
add_test(
		NAME
		unit_tests
		COMMAND
		$<TARGET_FILE:unit_tests>
)