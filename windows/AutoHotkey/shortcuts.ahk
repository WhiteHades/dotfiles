#Requires AutoHotkey v2.0

; alt + q - close window
!q:: {
    WinClose("A")  ; "A" = active window
}

; alt + w - browser
!w:: {
    Run("http:")
}

; alt + e - explorer
!e:: {
    Run("explorer.exe")
}

; alt + r - terminal
!r:: {
    Run('wt.exe -p "PowerShell" -d "D:\codes"')
}

; dual-role capsLock
*CapsLock:: {
    cDown := A_TickCount
    Send("{Blind}{Ctrl Down}")
}
*CapsLock Up:: {
    Send("{Blind}{Ctrl Up}")
    if (A_PriorKey == "CapsLock" && A_TimeSincePriorHotkey < 400) {
        Send("{Esc}")
    }
}

; lctrl -> capsLock
LCtrl::CapsLock

; alt+capsLock+hjkl -> arrow keys
; powertoys keyboard manager

; alt+hjkl
; powertoys keyboard manager