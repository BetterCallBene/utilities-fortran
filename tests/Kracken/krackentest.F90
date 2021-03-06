      program krackentest
      use M_kracken

! call with an arbitrary verb name and a string that defines
! allowable switch names and default values

      call kracken('mycommand',&
     &' -i 10 -r 200.3 -par1 "#N#" -par2 -par3 10 20 30 -files ', &
     & ierror)

! that's it. Now you can just retrieve the values as strings
! using names of the form VERB_SWITCHNAME anywhere in your program
! the special name VERB_oo is for the string before a switch

      call samples()
      end
!=======================================================================--------
      subroutine samples
      use M_kracken
      character(len=255) :: value

! Getting everything before a switch
      call retrev('mycommand_oo',value,len,ier)
      write(*,*)'before any switch=',value(:len)

! Getting an integer from -i value
      call retrev('mycommand_i',value,len,ier)
      write(*,*)'value for -i =',value(:len)
      call string_to_real(value,anumber,ier)
      write(*,*)'divided by 2 is ',int(anumber)/2

! Getting a real number from -r value
      call retrev('mycommand_r',value,len,ier)
      write(*,*)'value for -r =',value(:len)
      call string_to_real(value,anumber,ier)
      write(*,*)'divided by 2 is ',anumber/2

! Getting a string (with a default) from -par1
      call retrev('mycommand_par1',value,len,ier)
      write(*,*)'value for -par1 =',value(:len)

! Getting a string (with no default) from -par2
      call retrev('mycommand_par2',value,len,ier)
      write(*,*)'value for -par2 =',value(:len)

! Getting a string with a multi-word default and splitting it from -par3
      call listem('mycommand_par3','-par3',.true.)

! a list of files
      call listem('mycommand_files','-files',.false.)

      end
!=======================================================================--------
      subroutine listem(keyword,label,toreal)
      use M_kracken
!     Just getting fancy and showing the use of DELIM()
!     SAMPLE that decomposes list of strings and optionally, numbers
!     and prints it.
!     delimit with space, comma, or colon
      logical toreal
      character(len=*)    :: keyword
      character(len=*)    :: label
      character(len=255)  :: value

!     for DELIM call if you want to break down a list
      character(len=255)  ::  array(132)
      integer ibegin(132)
      integer iterm(132)

!     get the value of the keyword and the length
      call retrev(keyword,value,len,ier)
      write(*,*)'value for ',label,'=',value(:len)
!     split the list into one word per array
      call delim(value,array,132,igot,ibegin,iterm,ilen,' ,:')
!     convert each word into a numeric value
      do i10=1,igot
         write(*,*)i10,') ',array(i10)(:len_trim(array(i10)))
         if(toreal)then
            call string_to_real(array(i10),anumber,ier)
            if(ier.eq.0)then
               write(*,*)' which is a number'
            else
               write(*,*) ' which is not a number'
            endif
         endif
      enddo
      return
      end
!=======================================================================--------
