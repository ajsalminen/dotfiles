go() {
   if [ -f "$1" ]; then
     if [ -n "`file $1 | grep '\(text\|empty\|no magic\)'`" ]; then
       if [ -w "$1" ]; then
         emacsclient -n "$1"
         #$EDITOR "$1"
       else
          SUDO_EDITOR="emacsclient -n"
          sudoedit  "$1"
          #$EDITOR /sudo::"$1" # For emacsclient+tramp
       fi
     else
       if [ -e "`which xdg-open`" ]; then
         if [ -n "$DISPLAY" ]; then
           xdg-open "$1" > /dev/null
         else
           echo "DISPLAY not set:  xdg-open requires X11"
         fi
       else
         echo "xdg-open not found:  unable to open '$1'"
       fi
     fi
   elif [ -d "$1" ]; then
     cd "$1"
   elif [ "" = "$1" ]; then
     cd
   elif [ -n "`declare -f | grep '^fasd_cd ()'`" ]; then
     fasd_cd -d "$1"
   else
     echo "Ran out of things to do with '$1'"
   fi
 }

 alias go=go
