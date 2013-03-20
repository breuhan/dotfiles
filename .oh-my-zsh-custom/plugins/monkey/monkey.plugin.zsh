TRANS='/Applications/Monkey/bin/trans_macos'
FILE='$(ls -1 *.monkey | head -n 1)'

#  Schema: MONKEY   TARGET MODE    CONFIG
# Example: m(onkey) g(lfw) b(uild) r(elease)
#    Hint: Omit the last part and it's a debug build :)

alias mgb=" $TRANS -config=debug   -target=glfw -build  $FILE"
alias mgc=" $TRANS -config=debug   -target=glfw -check  $FILE"
alias mgr=" $TRANS -config=debug   -target=glfw -run    $FILE"
alias mgu=" $TRANS -config=debug   -target=glfw -update $FILE"
alias mgbr="$TRANS -config=release -target=glfw -build  $FILE"
alias mgcr="$TRANS -config=release -target=glfw -check  $FILE"
alias mgrr="$TRANS -config=release -target=glfw -run    $FILE"
alias mgur="$TRANS -config=release -target=glfw -update $FILE"

alias mib=" $TRANS -config=debug   -target=ios -build  $FILE"
alias mic=" $TRANS -config=debug   -target=ios -check  $FILE"
alias mir=" $TRANS -config=debug   -target=ios -run    $FILE"
alias miu=" $TRANS -config=debug   -target=ios -update $FILE"
alias mibr="$TRANS -config=release -target=ios -build  $FILE"
alias micr="$TRANS -config=release -target=ios -check  $FILE"
alias mirr="$TRANS -config=release -target=ios -run    $FILE"
alias miur="$TRANS -config=release -target=ios -update $FILE"

alias mhb=" $TRANS -config=debug   -target=html5 -build  $FILE"
alias mhc=" $TRANS -config=debug   -target=html5 -check  $FILE"
alias mhr=" $TRANS -config=debug   -target=html5 -run    $FILE"
alias mhu=" $TRANS -config=debug   -target=html5 -update $FILE"
alias mhbr="$TRANS -config=release -target=html5 -build  $FILE"
alias mhcr="$TRANS -config=release -target=html5 -check  $FILE"
alias mhrr="$TRANS -config=release -target=html5 -run    $FILE"
alias mhur="$TRANS -config=release -target=html5 -update $FILE"

alias mfb=" $TRANS -config=debug   -target=flash -build  $FILE"
alias mfc=" $TRANS -config=debug   -target=flash -check  $FILE"
alias mfr=" $TRANS -config=debug   -target=flash -run    $FILE"
alias mfu=" $TRANS -config=debug   -target=flash -update $FILE"
alias mfbr="$TRANS -config=release -target=flash -build  $FILE"
alias mfcr="$TRANS -config=release -target=flash -check  $FILE"
alias mfrr="$TRANS -config=release -target=flash -run    $FILE"
alias mfur="$TRANS -config=release -target=flash -update $FILE"

alias mab=" $TRANS -config=debug   -target=android -build  $FILE"
alias mac=" $TRANS -config=debug   -target=android -check  $FILE"
alias mar=" $TRANS -config=debug   -target=android -run    $FILE"
alias mau=" $TRANS -config=debug   -target=android -update $FILE"
alias mabr="$TRANS -config=release -target=android -build  $FILE"
alias macr="$TRANS -config=release -target=android -check  $FILE"
alias marr="$TRANS -config=release -target=android -run    $FILE"
alias maur="$TRANS -config=release -target=android -update $FILE"

unset $TRANS $FILE
