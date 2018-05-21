module colorout
	implicit none
	private
	public :: color_term

	character(len=1), parameter, private :: c_esc = achar(27)
    character(len=2), parameter, private :: c_start = c_esc // '['
    character(len=1), parameter, private :: c_end = 'm'
    character(len=*), parameter, private :: c_black = '30'
    character(len=*), parameter, private :: c_red = '31'
    character(len=*), parameter, private :: c_green = '32'
    character(len=*), parameter, private :: c_yellow = '33'
    character(len=*), parameter, private :: c_blue = '34'
    character(len=*), parameter, private :: c_magenta = '35'
    character(len=*), parameter, private :: c_cyan = '36'
    character(len=*), parameter, private :: c_white = '37'
    character(len=*), parameter, private :: c_clear = c_start // '0' // c_end
contains
	 !> color for terminal
    function color_term(str, code) result(out)
        character(len=*), intent(in) :: str
        character(len=*), intent(in) :: code
        character(len=:), allocatable :: out
        out = c_start // code // c_end // str // c_clear
    end function color_term

end module