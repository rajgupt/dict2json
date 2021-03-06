package require json::write

namespace eval ::json::write {

    proc dict2json { mydict } {

        set accumulate {}
        
        dict for {key value} $mydict {
            puts $key
            if { [llength $value] > 1 } {
                lappend accumulate $key [dict2json $value]
            } else {
                lappend accumulate $key [json::write string $value]
            }
        }
        return [json::write object {*}$accumulate]
    }
}