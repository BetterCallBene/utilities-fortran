enable_language ( Fortran )
add_executable(unit_tests_kracken
	krackentest.F90
)
target_link_libraries(unit_tests_kracken
		kracken
)
add_test(
		NAME
		unit_tests_kracken
		COMMAND
		$<TARGET_FILE:unit_tests_kracken>
)