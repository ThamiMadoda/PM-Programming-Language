!
!PM (Parallel Models) Programming Language
!
!Released under the MIT License (MIT)
!
!Copyright (c) Tim Bellerby, 2015
!
!Permission is hereby granted, free of charge, to any person obtaining a copy
! of this software and associated documentation files (the "Software"), to deal
! in the Software without restriction, including without limitation the rights
! to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
! copies of the Software, and to permit persons to whom the Software is
! furnished to do so, subject to the following conditions:
!
!The above copyright notice and this permission notice shall be included in
! all copies or substantial portions of the Software.
!
! THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
! IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
! FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
! AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
! LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
! OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
! THE SOFTWARE.
module pm_sysdefs
  use pm_kinds
  use pm_memory
  use pm_parser
  use pm_types
  implicit none

  integer,parameter:: pm_max_stack=127

  integer(pm_i16),parameter:: op_call=0
  integer(pm_i16),parameter:: op_poly_call=1
  integer(pm_i16),parameter:: op_poly_call_vect=2
  integer(pm_i16),parameter:: first_jmp_op=3
  integer(pm_i16),parameter:: op_jmp=3
  integer(pm_i16),parameter:: op_jmp_true=4
  integer(pm_i16),parameter:: op_jmp_false=5
  integer(pm_i16),parameter:: op_and_jmp_none=6
  integer(pm_i16),parameter:: op_andnot_jmp_none=7
  integer(pm_i16),parameter:: op_and_jmp_any=8
  integer(pm_i16),parameter:: op_andnot_jmp_any=9
  integer(pm_i16),parameter:: op_loop_start=10
  integer(pm_i16),parameter:: op_loop_start_vect=11
  integer(pm_i16),parameter:: op_loop_end=12
  integer(pm_i16),parameter:: op_loop_end_vect=13

  integer(pm_i16),parameter:: last_jmp_op=13

  integer(pm_i16),parameter:: op_struct=14
  integer(pm_i16),parameter:: op_struct_vect=15
  integer(pm_i16),parameter:: op_array=16
  integer(pm_i16),parameter:: op_array_vect=17
  integer(pm_i16),parameter:: op_any=18
  integer(pm_i16),parameter:: op_any_vect=19
  integer(pm_i16),parameter:: op_struct_elem=20
  integer(pm_i16),parameter:: op_struct_elem_vect=21
  integer(pm_i16),parameter:: op_poly_struct_elem=22
  integer(pm_i16),parameter:: op_poly_struct_elem_vect=23
  integer(pm_i16),parameter:: op_check=24
  integer(pm_i16),parameter:: op_check_vect=25

  integer(pm_i16),parameter:: op_import=26
  integer(pm_i16),parameter:: op_export=27
  integer(pm_i16),parameter:: op_return=28
  integer(pm_i16),parameter:: op_par_loop_end=29

  integer(pm_i16),parameter:: op_dump= 30
  integer(pm_i16),parameter:: first_assign_op=31
  integer(pm_i16),parameter:: op_par_loop=32
  integer(pm_i16),parameter:: op_par_loop_vect=33

  integer(pm_i16),parameter:: op_setref=34
  integer(pm_i16),parameter:: op_setref_vect=35
  integer(pm_i16),parameter:: op_clone=36
  integer(pm_i16),parameter:: op_clone_vect=37
  integer(pm_i16),parameter:: op_vcall =38

  integer(pm_i16),parameter:: op_print=39
  integer(pm_i16),parameter:: op_concat=40

  integer(pm_i16),parameter:: op_assign=49
  integer(pm_i16),parameter:: op_ass=op_assign+1-pm_int
  integer(pm_i16),parameter:: op_assign_int=op_ass+pm_int
  integer(pm_i16),parameter:: op_assign_long=op_ass+pm_long
  integer(pm_i16),parameter:: op_assign_int8=op_ass+pm_int8
  integer(pm_i16),parameter:: op_assign_int16=op_ass+pm_int16
  integer(pm_i16),parameter:: op_assign_int32=op_ass+pm_int32
  integer(pm_i16),parameter:: op_assign_int64=op_ass+pm_int64
  integer(pm_i16),parameter:: op_assign_int128=op_ass+pm_int128
  integer(pm_i16),parameter:: op_assign_single=op_ass+pm_single
  integer(pm_i16),parameter:: op_assign_double=op_ass+pm_double
  integer(pm_i16),parameter:: op_assign_real32=op_ass+pm_real32
  integer(pm_i16),parameter:: op_assign_real64=op_ass+pm_real64
  integer(pm_i16),parameter:: op_assign_real128=op_ass+pm_real128
  integer(pm_i16),parameter:: op_assign_single_complex=op_ass+pm_single_complex
  integer(pm_i16),parameter:: op_assign_double_complex=op_ass+pm_double_complex
  integer(pm_i16),parameter:: op_assign_complex64=op_ass+pm_complex64
  integer(pm_i16),parameter:: op_assign_complex128=op_ass+pm_complex128
  integer(pm_i16),parameter:: op_assign_complex256=op_ass+pm_complex256
  integer(pm_i16),parameter:: op_assign_logical=op_ass+pm_logical
  integer(pm_i16),parameter:: op_assign_packed_logical=op_ass+pm_packed_logical
  integer(pm_i16),parameter:: op_assign_string=op_ass+pm_string
  integer(pm_i16),parameter:: op_assign_ext=op_ass+pm_ext

  integer(pm_i16),parameter:: op_assign_vect=op_assign_ext+1
  integer(pm_i16),parameter:: op_ass_vect=op_assign_vect+1-pm_int
  integer(pm_i16),parameter:: op_assign_int_vect=op_ass_vect+pm_int
  integer(pm_i16),parameter:: op_assign_long_vect=op_ass_vect+pm_long
  integer(pm_i16),parameter:: op_assign_int8_vect=op_ass_vect+pm_int8
  integer(pm_i16),parameter:: op_assign_int16_vect=op_ass_vect+pm_int16
  integer(pm_i16),parameter:: op_assign_int32_vect=op_ass_vect+pm_int32
  integer(pm_i16),parameter:: op_assign_int64_vect=op_ass_vect+pm_int64
  integer(pm_i16),parameter:: op_assign_int128_vect=op_ass_vect+pm_int128
  integer(pm_i16),parameter:: op_assign_single_vect=op_ass_vect+pm_single
  integer(pm_i16),parameter:: op_assign_double_vect=op_ass_vect+pm_double
  integer(pm_i16),parameter:: op_assign_real32_vect=op_ass_vect+pm_real32
  integer(pm_i16),parameter:: op_assign_real64_vect=op_ass_vect+pm_real64
  integer(pm_i16),parameter:: op_assign_real128_vect=op_ass_vect+pm_real128
  integer(pm_i16),parameter:: op_assign_single_complex_vect=op_ass_vect+pm_single_complex
  integer(pm_i16),parameter:: op_assign_double_complex_vect=op_ass_vect+pm_double_complex
  integer(pm_i16),parameter:: op_assign_complex64_vect=op_ass_vect+pm_complex64
  integer(pm_i16),parameter:: op_assign_complex128_vect=op_ass_vect+pm_complex128
  integer(pm_i16),parameter:: op_assign_complex256_vect=op_ass_vect+pm_complex256
  integer(pm_i16),parameter:: op_assign_logical_vect=op_ass_vect+pm_logical
  integer(pm_i16),parameter:: op_assign_packed_logical_vect=op_ass_vect+pm_packed_logical
  integer(pm_i16),parameter:: op_assign_string_vect=op_ass_vect+pm_string
  integer(pm_i16),parameter:: op_assign_ext_vect=op_ass_vect+pm_ext
  integer(pm_i16),parameter:: last_assign_op=op_assign_ext_vect
  
  integer(pm_i16),parameter:: op_alloc=last_assign_op+1
  integer(pm_i16),parameter:: first_alloc_op=op_alloc
  integer(pm_i16),parameter:: op_alc=op_alloc+1-pm_int
  integer(pm_i16),parameter:: op_alloc_int=op_alc+pm_int
  integer(pm_i16),parameter:: op_alloc_long=op_alc+pm_long
  integer(pm_i16),parameter:: op_alloc_int8=op_alc+pm_int8
  integer(pm_i16),parameter:: op_alloc_int16=op_alc+pm_int16
  integer(pm_i16),parameter:: op_alloc_int32=op_alc+pm_int32
  integer(pm_i16),parameter:: op_alloc_int64=op_alc+pm_int64
  integer(pm_i16),parameter:: op_alloc_int128=op_alc+pm_int128
  integer(pm_i16),parameter:: op_alloc_single=op_alc+pm_single
  integer(pm_i16),parameter:: op_alloc_double=op_alc+pm_double
  integer(pm_i16),parameter:: op_alloc_real32=op_alc+pm_real32
  integer(pm_i16),parameter:: op_alloc_real64=op_alc+pm_real64
  integer(pm_i16),parameter:: op_alloc_real128=op_alc+pm_real128
  integer(pm_i16),parameter:: op_alloc_single_complex=op_alc+pm_single_complex
  integer(pm_i16),parameter:: op_alloc_double_complex=op_alc+pm_double_complex
  integer(pm_i16),parameter:: op_alloc_complex64=op_alc+pm_complex64
  integer(pm_i16),parameter:: op_alloc_complex128=op_alc+pm_complex128
  integer(pm_i16),parameter:: op_alloc_complex256=op_alc+pm_complex256
  integer(pm_i16),parameter:: op_alloc_logical=op_alc+pm_logical
  integer(pm_i16),parameter:: op_alloc_packed_logical=op_alc+pm_packed_logical
  integer(pm_i16),parameter:: op_alloc_string=op_alc+pm_string
  integer(pm_i16),parameter:: op_alloc_ext=op_alc+pm_ext
  integer(pm_i16),parameter:: op_nullify=op_alc+pm_pointer
  integer(pm_i16),parameter:: last_alloc_op=op_nullify 

  integer(pm_i16),parameter:: op_start_i=op_nullify
  integer(pm_i16),parameter:: op_add_i=op_start_i+1
  integer(pm_i16),parameter:: op_add_i_vect=op_start_i+2
  integer(pm_i16),parameter:: op_sub_i=op_start_i+3
  integer(pm_i16),parameter:: op_sub_i_vect=op_start_i+4
  integer(pm_i16),parameter:: op_mult_i=op_start_i+5
  integer(pm_i16),parameter:: op_mult_i_vect=op_start_i+6
  integer(pm_i16),parameter:: op_divide_i=op_start_i+7
  integer(pm_i16),parameter:: op_divide_i_vect=op_start_i+8
  integer(pm_i16),parameter:: op_div_i=op_start_i+9
  integer(pm_i16),parameter:: op_div_i_vect=op_start_i+10
  integer(pm_i16),parameter:: op_mod_i=op_start_i+11
  integer(pm_i16),parameter:: op_mod_i_vect=op_start_i+12
  integer(pm_i16),parameter:: op_pow_i=op_start_i+13
  integer(pm_i16),parameter:: op_pow_i_vect=op_start_i+14
  integer(pm_i16),parameter:: op_uminus_i=op_start_i+15
  integer(pm_i16),parameter:: op_uminus_i_vect=op_start_i+16
  integer(pm_i16),parameter:: op_eq_i=op_start_i+17
  integer(pm_i16),parameter:: op_eq_i_vect=op_start_i+18
  integer(pm_i16),parameter:: op_ne_i=op_start_i+19
  integer(pm_i16),parameter:: op_ne_i_vect=op_start_i+20
  integer(pm_i16),parameter:: op_gt_i=op_start_i+21
  integer(pm_i16),parameter:: op_gt_i_vect=op_start_i+22
  integer(pm_i16),parameter:: op_ge_i=op_start_i+25
  integer(pm_i16),parameter:: op_ge_i_vect=op_start_i+26
  integer(pm_i16),parameter:: op_string_i=op_start_i+27
  integer(pm_i16),parameter:: op_string_i_vect=op_start_i+28
  integer(pm_i16),parameter:: op_get_elt_i=op_start_i+29
  integer(pm_i16),parameter:: op_get_elt_i_vect=op_start_i+30
  integer(pm_i16),parameter:: op_set_elt_i=op_start_i+31
  integer(pm_i16),parameter:: op_set_elt_i_vect=op_start_i+32

  integer(pm_i16),parameter:: op_check_conform= op_set_elt_i_vect+1
  integer(pm_i16),parameter:: op_get_elt=op_check_conform+1
  integer(pm_i16),parameter:: op_set_elt=op_check_conform+2
  integer,parameter:: num_op=op_set_elt

  integer,parameter:: sym_pm_system = num_sym+1
  integer,parameter:: sym_get_element = num_sym+2
  integer,parameter:: sym_set_element = num_sym+3
  integer,parameter:: sym_num_elements= num_sym+4
  integer,parameter:: sym_import_val = num_sym+5
  integer,parameter:: sym_import = num_sym+6
  integer,parameter:: sym_export = num_sym+7 
  integer,parameter:: sym_partition = num_sym+8
  integer,parameter:: sym_check_conform = num_sym+9
  integer,parameter:: sym_sub_ref = num_sym+10
  integer,parameter:: sym_sync = num_sym + 11
  integer,parameter:: sym_proc_grid = num_sym + 12
  integer,parameter:: sym_num_procs = num_sym + 13
  integer,parameter:: sym_grid = num_sym + 14
  integer,parameter:: sym_dom = num_sym + 15
 
  integer,parameter:: num_syshook = 15

  character(len=20),dimension(0:num_op):: op_names

  character(len=14),dimension(num_syshook),parameter:: syshook = (/ &
       'PM system     ','get_elem      ','set_elem      ','num_elem      ',&
       'PM__import_val','PM__import    ','PM__export    ','PM__partition ',&
       'check_conform ','PM__sub_ref   ','PM__sync      ','proc_grid     ',&
       'num_procs     ','grid          ','dom           ' /)

contains

  subroutine syshooks(parser)
    type(parse_state):: parser
    integer:: i,j
    do i=1,num_syshook
       if(syshook(i)(1:1)=='_') then
          j=lname_entry(parser,trim(syshook(i)(2:)))
          if(i+num_sym/=j) then
             write(*,*) 'L',i,i+num_sym,j,num_sym
             call pm_panic('Setting syshooks')
          endif
       else
          j=name_entry(parser,trim(syshook(i)))
          if(i+num_sym/=j) then
             write(*,*) i,i+num_sym,j,num_sym
             call pm_panic('Setting syshooks')
          endif
       endif
    enddo
  end subroutine syshooks
 
  subroutine sysdefs(parser)
    type(parse_state):: parser

    call dcl_module(parser,"PM system")
    parser%sysmodl=parser%modl
    call syshooks(parser)
    call init_typ(parser%context)
 
    call dcl_proc(parser,'print(string)',op_print,0_pm_i16,pm_null_obj,0)
    call dcl_uproc(parser,'print(x) do print(string(x)) endproc')
    call dcl_proc(parser,'//(string,string)->string',op_concat,0_pm_i16,pm_null_obj,0)
    call dcl_uproc(parser,'//(x:string,y)=proc //(x,string(y))')
    call dcl_uproc(parser,'//(x,y)=proc //(string(x),string(y))')
    call dcl_uproc(parser,'string(x:string)=x')
    call dcl_proc(parser,'div(int,int)->int',op_div_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'mod(int,int)->int',op_mod_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'==(int,int)->bool',op_eq_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'/=(int,int)->bool',op_ne_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'>=(int,int)->bool',op_ge_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'>(int,int)->bool',op_gt_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'+(int,int)->int',op_add_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'-(int,int)->int',op_sub_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'*(int,int)->int',op_mult_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'/(int,int)->real',op_divide_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'**(int,int)->int',op_pow_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'-(int)->int',op_uminus_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'=(&int,int)',op_assign_int,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'string(int)->string',op_string_i,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'=(==&)',op_assign,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'get_elem(a:int(/_/),long)->int',op_get_elt_i,&
         0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'set_elem(a:int(/_/),int,long)',op_set_elt_i,&
         0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'(//)(a:int(/long/),long)->int',op_get_elt_i,&
         0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'(//)=(&a:int(/long/),int,long)',op_set_elt_i,&
         0_pm_i16,pm_null_obj,0)  

    call dcl_uproc(parser,'check_conform(arg...) do endproc')
    call dcl_proc(parser,'=(&_(/_/),_(/_/))',op_assign,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'dump(_)',op_dump,0_pm_i16,pm_null_obj,0)
    
    call dcl_type(parser,'std_int is int,long')
    call dcl_type(parser,'any_int is std_int,int8,int16,int32,int64,int128')
    call dcl_type(parser,'std_real is real,double')
    call dcl_type(parser,'any_real is std_real,real32,real64,real128')
    call dcl_type(parser,'std_cpx is cpx,double_cpx')
    call dcl_type(parser,'any_cpx is std_cpx, cpx64, cpx128, cpx256')
    call dcl_type(parser,'int_num includes any_int')
    call dcl_type(parser,'real_num includes int_num, any_real')
    call dcl_type(parser,'cpx_num includes real_num,any_cpx')
    call dcl_type(parser,'num includes cpx_num')

    call dcl_type(parser,'range_base includes real_num')
    call dcl_type(parser,'range{t:range_base} is rec _range{_lo:t,_hi:t}')
    call dcl_uproc(parser,'..(x:range_base,y:range_base)= rec _range{_lo=x,_hi=y}')
    call dcl_proc(parser,'low(x:range{})->=x._lo',op_struct_elem,1_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'high(x:range{})->=x._hi',op_struct_elem,2_pm_i16,pm_null_obj,0)
    call dcl_type(parser,'seq{t:range_base} is rec _seq{_lo:t,_hi:t,_st:t}')
    call dcl_proc(parser,'low(x:seq{})->=x._lo',op_struct_elem,1_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'high(x:seq{})->=x._hi',op_struct_elem,2_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'step(x:seq{})->=x._st',op_struct_elem,3_pm_i16,pm_null_obj,0)
    call dcl_type(parser,'grid_base includes std_int,range{std_int},seq{}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base} is rec _grid{_d1:t1,_d2:t2}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base,t3:grid_base} is'//&
         ' rec _grid{_d1:t1,_d2:t2,_d3:t3}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base,t3:grid_base,t4:grid_base} is'//&
         ' rec _grid{_d1:t1,_d2:t2,_d3:t3,_d4:t4}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base,t3:grid_base,t4:grid_base,t5:grid_base} is'//&
         ' rec _grid{_d1:t1,_d2:t2,_d3:t3,_d4:t4,_d5:t5}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base,t3:grid_base,t4:grid_base,'//&
         't5:grid_base,t6:grid_base} is'//&
         ' rec _grid{_d1:t1,_d2:t2,_d3:t3,_d4:t4,_d5:t5,_d6:t6}')
    call dcl_type(parser,'grid{t1:grid_base,t2:grid_base,t3:grid_base,t4:grid_base,t5:grid_base,'//&
         't6:grid_base,t7:grid_base} is'//&
         ' rec _grid{_d1:t1,_d2:t2,_d3:t3,_d4:t4,_d5:t5,_d6:t6,_d7:t7}')
    call dcl_type(parser,'grid2d is grid{,}')
    call dcl_type(parser,'grid3d is grid{,,}')
    call dcl_type(parser,'grid4d is grid{,,,}')
    call dcl_type(parser,'grid5d is grid{,,,,}')
    call dcl_type(parser,'grid6d is grid{,,,,,}')
    call dcl_type(parser,'grid7d is grid{,,,,,,}')
    call dcl_type(parser,'grid is grid2d,grid3d,grid4d,grid5d,grid6d,grid7d')
    call dcl_uproc(parser,'num_elem(x:grid2d)=num_elem(x._d1)*num_elem(x._d2)')
    call dcl_uproc(parser,'num_elem(x:grid3d)=num_elem(x._d1)*num_elem(x._d2)*num_elem(x._d3)')
    call dcl_uproc(parser,'num_elem(x:grid4d)=num_elem(x._d1)*num_elem(x._d2)*num_elem(x._d3)'//&
         '*num_elem(x._d4)')
    call dcl_uproc(parser,'num_elem(x:grid5d)=num_elem(x._d1)*num_elem(x._d2)*num_elem(x._d3)'//&
         '*num_elem(x._d4)*num_elem(x._d5)')
    call dcl_uproc(parser,'num_elem(x:grid6d)=num_elem(x._d1)*num_elem(x._d2)*num_elem(x._d3)'//&
         '*num_elem(x._d4)*num_elem(x._d5)*num_elem(x._d6)')
    call dcl_uproc(parser,'num_elem(x:grid7d)=num_elem(x._d1)*num_elem(x._d2)*num_elem(x._d3)'//&
         '*num_elem(x._d4)*num_elem(x._d5)*num_elem(x._d6)*num_elem(x._d7)')

    call dcl_type(parser,'dom is grid_base,grid')
    call dcl_uproc(parser,'dim(x:_,y:long)=_array(x,y,y)')
    call dcl_proc(parser,'num_elem(_(/long/))->long',op_struct_elem,2_pm_i16,pm_null_obj,0)
    call dcl_uproc(parser,'dim(x:_,y:_)=_array(x,num_elem(y),y)')
    call dcl_proc(parser,'_array(x:_,y:long,z:_)->dim x,z',op_array,0_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'dom(x:_(/_/))->#x',op_struct_elem,2_pm_i16,pm_null_obj,0)
    call dcl_proc(parser,'elts(x:_(/_/))->*x',op_struct_elem,1_pm_i16,pm_null_obj,0)

    call dcl_uproc(parser,'PM__import(x,y,z)=elts(x)')
    call dcl_uproc(parser,'PM__export(w,x,y,z) do endproc')
    call dcl_uproc(parser,'PM__sync(w,x,y,z) do endproc')
    call dcl_uproc(parser,'PM__partition(w,arg...)=1,1,1,1')
    call dcl_uproc(parser,'num_procs()=1l')
    
  end subroutine sysdefs

  subroutine set_op_names
    op_names='??'
    op_names(op_call)='op_call'
    op_names(op_poly_call)='op_poly_call'
    op_names(op_poly_call_vect)='op_poly_call_vect'
    op_names(op_jmp)='op_jmp'
    op_names(op_jmp_true)='op_jmp_true'
    op_names(op_jmp_false)='op_jmp_false'
    op_names(op_and_jmp_none)='op_and_jmp_none'
    op_names(op_andnot_jmp_none)='op_andnot_jmp_none'
    op_names(op_and_jmp_any)='op_and_jmp_any'
    op_names(op_andnot_jmp_any)='op_andnot_jmp_any'    
    op_names(op_setref)='op_setref'
    op_names(op_setref_vect)='op_setref_vect'
    op_names(op_struct)='op_struct'
    op_names(op_struct_vect)='op_struct_vect'
    op_names(op_clone)='op_clone'
    op_names(op_clone_vect)='op_clone_vect'
    op_names(op_array)='op_array'
    op_names(op_array_vect)='op_array_vect'
    op_names(op_any)='op_any'
    op_names(op_check)='op_check'
    op_names(op_check_vect)='op_check_vect'
    op_names(op_return)='op_return'
    op_names(op_par_loop_end)='op_par_loop_end'
    op_names(op_struct_elem)='op_struct_elem'
    op_names(op_struct_elem_vect)='op_struct_elem_vect'
    op_names(op_par_loop)='op_par_loop'
    op_names(op_par_loop_vect)='op_par_loop_vect'
    op_names(op_import)='op_import'
    op_names(op_export)='op_export'

    op_names(op_vcall)='op_vcall'
    
    op_names(op_assign)='op_assign'
    op_names(op_assign_int)='op_assign_int'
    op_names(op_assign_long)='op_assign_long'
    op_names(op_assign_int8)='op_assign_int8'
    op_names(op_assign_int16)='op_assign_int16'
    op_names(op_assign_int32)='op_assign_int32'
    op_names(op_assign_int64)='op_assign_int64'
    op_names(op_assign_int128)='op_assign_int128'
    op_names(op_assign_single)='op_assign_single'
    op_names(op_assign_double)='op_assign_double'
    op_names(op_assign_real32)='op_assign_real32'
    op_names(op_assign_real64)='op_assign_real64'
    op_names(op_assign_real128)='op_assign_real128'
    op_names(op_assign_single_complex)='op_assign_single_complex'
    op_names(op_assign_double_complex)='op_assign_double_complex'
    op_names(op_assign_complex64)='op_assign_complex64'
    op_names(op_assign_complex128)='op_assign_complex128'
    op_names(op_assign_complex256)='op_assign_complex256'
    op_names(op_assign_logical)='op_assign_logical'
    op_names(op_assign_packed_logical)='op_assign_packed_logical'
    op_names(op_assign_string)='op_assign_string'
    op_names(op_assign_ext)='op_assign_ext'
    
    op_names(op_assign_vect)='op_assign_vect'
    op_names(op_assign_int_vect)='op_assign_int_vect'
    op_names(op_assign_long_vect)='op_assign_long_vect'
    op_names(op_assign_int8_vect)='op_assign_int8_vect'
    op_names(op_assign_int16_vect)='op_assign_int16_vect'
    op_names(op_assign_int32_vect)='op_assign_int32_vect'
    op_names(op_assign_int64_vect)='op_assign_int64_vect'
    op_names(op_assign_int128_vect)='op_assign_int128_vect'
    op_names(op_assign_single_vect)='op_assign_single_vect'
    op_names(op_assign_double_vect)='op_assign_double_vect'
    op_names(op_assign_real32_vect)='op_assign_real32_vect'
    op_names(op_assign_real64_vect)='op_assign_real64_vect'
    op_names(op_assign_real128_vect)='op_assign_real128_vect'
    op_names(op_assign_single_complex_vect)='op_assign_single_complex_vect'
    op_names(op_assign_double_complex_vect)='op_assign_double_complex_vect'
    op_names(op_assign_complex64_vect)='op_assign_complex64_vect'
    op_names(op_assign_complex128_vect)='op_assign_complex128_vect'
    op_names(op_assign_complex256_vect)='op_assign_complex256_vect'
    op_names(op_assign_logical_vect)='op_assign_logical_vect'
    op_names(op_assign_packed_logical_vect)='op_assign_packed_logical_vect'
    op_names(op_assign_string_vect)='op_assign_string_vect'
    op_names(op_assign_ext_vect)='op_assign_ext_vect'
    
    op_names(op_loop_start)='op_loop_start'
    op_names(op_loop_start_vect)='op_loop_start_vect'
    op_names(op_loop_end)='op_loop_end'
    op_names(op_loop_end_vect)='op_loop_end_vect'

    op_names(op_alloc)='op_alloc'
    op_names(op_alloc_int)='op_alloc_int'
    op_names(op_alloc_long)='op_alloc_long'
    op_names(op_alloc_int8)='op_alloc_int8'
    op_names(op_alloc_int16)='op_alloc_int16'
    op_names(op_alloc_int32)='op_alloc_int32'
    op_names(op_alloc_int64)='op_alloc_int64'
    op_names(op_alloc_int128)='op_alloc_int128'
    op_names(op_alloc_single)='op_alloc_single'
    op_names(op_alloc_double)='op_alloc_double'
    op_names(op_alloc_real32)='op_alloc_real32'
    op_names(op_alloc_real64)='op_alloc_real64'
    op_names(op_alloc_real128)='op_alloc_real128'
    op_names(op_alloc_single_complex)='op_alloc_single_complex'
    op_names(op_alloc_double_complex)='op_alloc_double_complex'
    op_names(op_alloc_complex64)='op_alloc_complex64'
    op_names(op_alloc_complex128)='op_alloc_complex128'
    op_names(op_alloc_complex256)='op_alloc_complex256'
    op_names(op_alloc_logical)='op_alloc_logical'
    op_names(op_alloc_packed_logical)='op_alloc_packed_logical'
    op_names(op_alloc_string)='op_alloc_string'
    op_names(op_alloc_ext)='op_alloc_ext'
    op_names(op_nullify)='op_nullify'
    
    op_names(op_add_i)='op_add_i'
    op_names(op_add_i_vect)='op_add_i_vect'
    op_names(op_sub_i)='op_sub_i'
    op_names(op_sub_i_vect)='op_sub_i_vect'
    op_names(op_mult_i)='op_mult_i'
    op_names(op_mult_i_vect)='op_mult_i_vect'
    op_names(op_divide_i)='op_divide_i'
    op_names(op_divide_i_vect)='op_divide_i_vect'
    op_names(op_div_i)='op_div_i'
    op_names(op_div_i_vect)='op_div_i_vect'
    op_names(op_mod_i)='op_mod_i'
    op_names(op_mod_i_vect)='op_mod_i_vect'
    op_names(op_pow_i)='op_pow_i'
    op_names(op_pow_i_vect)='op_pow_i_vect'
    op_names(op_uminus_i)='op_uminus_i'
    op_names(op_uminus_i_vect)='op_uminus_i_vect'
    op_names(op_eq_i)='op_eq_i'
    op_names(op_eq_i_vect)='op_eq_i_vect'
    op_names(op_ne_i)='op_ne_i'
    op_names(op_ne_i_vect)='op_ne_i_vect'
    op_names(op_gt_i)='op_gt_i'
    op_names(op_gt_i_vect)='op_gt_i_vect'
    op_names(op_ge_i)='op_ge_i'
    op_names(op_ge_i_vect)='op_ge_i_vect'
    op_names(op_get_elt_i)='op_get_elt_i'
    op_names(op_get_elt_i_vect)='op_get_elt_i_vect'
    op_names(op_set_elt_i)='op_set_elt_i'
    op_names(op_set_elt_i_vect)='op_set_elt_i_vect'
    
    op_names(op_check_conform)='op_check_conform'
    op_names(op_get_elt)='op_get_elt'
    op_names(op_set_elt)='op_set_elt'
  end subroutine set_op_names

  subroutine proc_line_module(prc,offset,line,modl)
    type(pm_ptr):: prc
    integer:: offset
    integer(pm_p),intent(out):: line,modl
    integer:: j
    integer(pm_i16):: k
    type(pm_ptr):: p
    p=prc%data%ptr(prc%offset+1)
    j=p%offset+pm_fast_esize(p)
    do
       k=p%data%i16(j)
       if(k==0) then
          j=j-p%data%i16(j-1)*2-4
       else
          if(p%data%i16(j-1)>offset) return
          if(k>0) then
             modl=k
          else 
             line=-k
          endif
          j=j-2
       endif
       if(j<p%offset) exit
    enddo
  contains
    include 'fesize.inc'
  end subroutine  proc_line_module

  function proc_slot_name(prc,offset,slot) result(name)
    type(pm_ptr):: prc
    integer:: offset,slot
    integer(pm_p):: name
    integer:: i,j,start,finish,n
    type(pm_ptr):: p
    integer(pm_i16):: k
    name=0
    p=prc%data%ptr(prc%offset+1)
    j=p%offset+pm_fast_esize(p)
    do
       k=p%data%i16(j)
       if(k/=0) then
          j=j-2
       else
          n=p%data%i16(j-1)
          start=p%data%i16(j-2)
          finish=p%data%i16(j-3)
          j=j-n*2-4
          if(offset>=start.and.offset<=finish) then
             do i=1,n
                if(p%data%i16(j+i*2-1)==slot) then
                   name=p%data%i16(j+i*2)
                   exit
                endif
             enddo
          endif
       endif
       if(j<p%offset) exit
    enddo
  contains
      include 'fesize.inc'
  end function proc_slot_name
  
end module pm_sysdefs