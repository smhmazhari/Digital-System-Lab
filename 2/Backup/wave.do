onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB/clock
add wave -noupdate /TB/reset
add wave -noupdate /TB/SerIn
add wave -noupdate /TB/P0
add wave -noupdate /TB/P1
add wave -noupdate /TB/P2
add wave -noupdate /TB/P3
add wave -noupdate /TB/done
add wave -noupdate /TB/SerOutValid
add wave -noupdate /TB/ssd_result
add wave -noupdate -divider {Port countr}
add wave -noupdate /TB/CUT/DP/Port_cnt/cnt1
add wave -noupdate /TB/CUT/DP/Port_cnt/co1
add wave -noupdate /TB/CUT/DP/Port_cnt/count
add wave -noupdate -divider {port shr}
add wave -noupdate /TB/CUT/DP/PortNum_shr/sh_en
add wave -noupdate /TB/CUT/DP/PortNum_shr/port_num
add wave -noupdate /TB/CUT/DP/PortNum_shr/SerIn
add wave -noupdate /TB/clkPB
add wave -noupdate -divider {data num counter}
add wave -noupdate /TB/CUT/DP/DataNum_cnt/cnt2
add wave -noupdate /TB/CUT/DP/DataNum_cnt/co2
add wave -noupdate /TB/CUT/DP/DataNum_cnt/count
add wave -noupdate -divider {datanum shr}
add wave -noupdate /TB/CUT/DP/DataNum_shr/sh_enD
add wave -noupdate /TB/CUT/DP/DataNum_shr/SerIn
add wave -noupdate /TB/CUT/DP/DataNum_shr/NumData
add wave -noupdate -divider {data trans counter}
add wave -noupdate /TB/CUT/DP/DataTrans_cnt/cntD
add wave -noupdate /TB/CUT/DP/DataTrans_cnt/ldcntD
add wave -noupdate /TB/CUT/DP/DataTrans_cnt/NumData
add wave -noupdate /TB/CUT/DP/DataTrans_cnt/coD
add wave -noupdate -radix unsigned /TB/CUT/DP/DataTrans_cnt/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2700 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {4725 ps}
