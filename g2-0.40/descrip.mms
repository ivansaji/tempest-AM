!
! VMS descrip.mms for g2
!

.IFDEF debug
CC_FLAGS        = /noopt/debug/nolist/warnings/include_directory=("./src") \
                  /define=(DO_PS=1, DO_X11=1)
.ELSE
CC_FLAGS        = /nolist/warnings/include_directory=("./src") \
                  /define=(DO_PS=1, DO_X11=1)
.ENDIF

!
! Object files
!
OBJ     = [.src]g2_device.obj, [.src]g2_fif.obj, [.src]g2_graphic_pd.obj, \
          [.src]g2_physical_device.obj, [.src]g2_ui_control.obj, \
          [.src]g2_ui_device.obj, [.src]g2_ui_graphic.obj, \
          [.src]g2_ui_virtual_device.obj, [.src]g2_util.obj, \
          [.src]g2_virtual_device.obj, [.src]g2_control_pd.obj
OBJ_X11 = [.src.X11]g2_X11.obj
OBJ_PS  = [.src.PS]g2_PS.obj

HEADERS     = [.src]g2.h, [.src]g2_config.h, [.src]g2_device.h, \
              [.src]g2_funix.h, [.src]g2_graphic_pd.h, \
              [.src]g2_physical_device.h, [.src]g2_util.h, \
              [.src]g2_virtual_device.h, [.src]g2_control_pd.h
HEADERS_X11 = [.src.X11]g2_X11.h, [.src.X11]g2_X11_P.h, \
              [.src.X11]g2_X11_funix.h
HEADERS_PS  = [.src.PS]g2_PS.h, [.src.PS]g2_PS_P.h, \
              [.src.PS]g2_PS_definitions.h, [.src.PS]g2_PS_funix.h
!
! Rules
!
.c.obj	: ; cc $(CC_FLAGS)/obj=$(mms$target) $(mms$source)


all	: g2.olb
	@ write sys$output "Done."

g2.olb	: $(OBJ) $(OBJ_X11) $(OBJ_PS)
	library/create g2.olb $(OBJ), $(OBJ_X11), $(OBJ_PS)

clean	:
	delete [...]*.exe;* , [...]*.obj;* , [...]*.olb;*


!
! Dependencies
!
[.src]g2_device.obj		: [.src]g2_device.c            $(HEADERS)
[.src]g2_fif.obj		: [.src]g2_fif.c               $(HEADERS)
[.src]g2_graphic_pd.obj		: [.src]g2_graphic_pd.c        $(HEADERS)
[.src]g2_physical_device.obj	: [.src]g2_physical_device.c   $(HEADERS)
[.src]g2_ui_control.obj		: [.src]g2_ui_control.c        $(HEADERS)
[.src]g2_ui_device.obj		: [.src]g2_ui_device.c         $(HEADERS)
[.src]g2_ui_graphic.obj		: [.src]g2_ui_graphic.c        $(HEADERS)
[.src]g2_ui_virtual_device.obj	: [.src]g2_ui_virtual_device.c $(HEADERS)
[.src]g2_util.obj		: [.src]g2_util.c              $(HEADERS)
[.src]g2_virtual_device.obj	: [.src]g2_virtual_device.c    $(HEADERS)
			
[.X11]g2_X11.obj	 : [.src.X11]g2_X11.c  $(HEADERS) $(HEADERS_X11)
[.PS]g2_PS.obj		 : [.src.PS]g2_PS.c    $(HEADERS) $(HEADERS_PS)

