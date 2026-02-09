vlib rtl_work
vmap work rtl_work
set curdir {/path/to/parent/folder/with/design/files}
set tb sample_test
set dev sample
#vcom -2008 -work work $curdir/$dev.vhd
#vcom -2008 -work work $curdir/test/$tb.vhd
#vlog $curdir/$dev.v
#vlog $curdir/test/$tb.v
vsim work.$tb
add wave /$tb/x
add wave /$tb/y
add wave /$tb/z
add wave /$tb/w
add wave /$tb/f
run 160ns
quit