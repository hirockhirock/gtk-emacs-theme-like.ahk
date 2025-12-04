;;
;; An autohotkey script that provides gtk-emacs-key-theme like keybinding on Windows
;; forked from https://github.com/usi3/emacs.ahk
;; Converted to AutoHotkey v2
;;
InstallKeybdHook(true)
#UseHook true

; The following line is a contribution of NTEmacs wiki http://www49.atwiki.jp/ntemacs/pages/20.html
SetKeyDelay(0)

; Applications you want to disable emacs-like keybindings
; (Please comment out applications you don't use)
is_target()
{
  if WinActive("ahk_class ConsoleWindowClass") ; Cygwin
    return true 
  if WinActive("ahk_class MEADOW") ; Meadow
    return true 
  if WinActive("ahk_class cygwin/x X rl-xterm-XTerm-0")
    return true
  if WinActive("ahk_class MozillaUIWindowClass") ; keysnail on Firefox
    return true
  ; Avoid VMwareUnity with AutoHotkey
  if WinActive("ahk_class VMwareUnityHostWndClass")
    return true
  if WinActive("ahk_class Vim") ; GVIM
    return true
  if WinActive("ahk_class mintty") ; WSL
    return true
  if WinActive("ahk_exe WindowsTerminal.exe") ; Windows Terminal
    return true
;  if WinActive("ahk_class SWT_Window0") ; Eclipse
;    return true
;   if WinActive("ahk_class Xming X")
;     return true
;   if WinActive("ahk_class SunAwtFrame")
;     return true
;   if WinActive("ahk_class Emacs") ; NTEmacs
;     return true  
;   if WinActive("ahk_class XEmacs") ; XEmacs on Cygwin
;     return true
  return false
}

;
; <ctrl>b
; move cursor backward
;
^b::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Left}")
}

;
; <shift><ctrl>b
; move cursor backward selecting chars
;
+^b::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+{Left}")
}

;
; <ctrl>f
; move cursor forward
;
^f::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Right}")
}

;
; <shift><ctrl>f  
; move cursor forward selecting chars
;
+^f::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+{Right}")
}

;
; <ctrl>p
; move cursor up
;
^p::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Up}")
}

;
; <shift><ctrl>p
; move cursor up selecting chars
;
+^p::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+{Up}")
}

;
; <ctrl>n
; move cursor down
;
^n::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Down}")
}

;
; <ctrl>d
; delete following char
;
^d::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Del}")
}

;
; <ctrl>h
; delete previous char(Backspace)
;
^h::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{BS}")
}

;
; <ctrl>a
; move cursor beginning of current line
;
^a::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{Home}")
}

;
; <shift><ctrl>a
; move cursor beginning of current line selecting chars
;
+^a::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+{Home}")
}

;
; <ctrl>e
; move cursor end of current line
;
^e::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("{End}")
}

;
; <shift><ctrl>e
; move cursor end of current line selecting chars
;
+^e::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+{End}")
}

;
; <alt>b
; move cursor one word backward
;
!b::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("^{Left}")
}

;
; <shift><alt>b
; move cursor one word backward selecting chars
;
+!b::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+^{Left}")
}

;
; <alt>f
; move cursor one word forward
;
!f::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("^{Right}")
}

;
; <shift><alt>f
; move cursor one word forward selecting chars
;
+!f::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("+^{Right}")
}

;
; <ctrl>k
; delete chars from cursor to end of line
;
^k::
{
  if is_target()
    Send(A_ThisHotkey)
  else
  {
    Send("{ShiftDown}{END}{SHIFTUP}")
    Sleep(50)
    Send("{Del}")
    ;Send("^x")
  }
}

;
; <ctrl>u
; delete chars from cursor to beginning of line
;
^u::
{
  if is_target()
    Send(A_ThisHotkey)
  else
  {
    Send("{ShiftDown}{HOME}{SHIFTUP}")
    Sleep(50)
    Send("{Del}")
    ;Send("^x")
  }
}

;
; <ctrl>\
; select all
;
^\::
{
  if is_target()
    Send(A_ThisHotkey)
  else
    Send("^a")
}
