source normal.tcl
proc normal_CDF {x mean sd} {
    global normal
    set y [expr 1.0 * ($x - $mean) / $sd]
    set y 0.98999999999999999
    puts "@149 y = $y"
    if {$y < 0} {
        set minus 1
        set y [expr abs($y)]
    } else {
        set minus 0
    }
    if {$y > 4.99} {
        set y 4.99
    } elseif {$y < 0.001} {
        set y 0.001
    }
    puts "2nd y = $y"
    if {[string length $y] > 4} {
        set t [string range $y 4 4]
        if {$t >= 5} {
            #set y [expr [string range $y 0 3] + 0.01]
            set y [expr $y + 0.01]
            puts "@24 y = $y"
            set y [string range $y 0 3]
            puts "@25 y = $y"
        } else {
            set y [string range $y 0 3]
        }
    }
    if {[string length $y] == 3} {
        append y "0"
    }
    if {[string length $y] == 1} {
        append y ".00"
    }
    puts "3rd y = $y"
    set value $normal($y)
    puts "valur = $value"
    if {$minus} {
        set value [expr 1.0 - $value]
    }
    return $value
}
normal_CDF 1 0 1