
BINDER=$HOME/Downloads/binder-linux/include/

CFLAGS="-c -std=c++11 -I$BINDER -Icode -Dbinder_size_t=size_t -Dflat_binder_object=int64_t"


g++-5 $CFLAGS data.cpp
g++-5 $CFLAGS listener.cpp


