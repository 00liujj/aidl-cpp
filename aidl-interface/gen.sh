set -ex

#(mkdir ../build && cd ../build/ && PATH=`pwd`:$PATH cmake ../ && make)

AIDL="LD_LIBRARY_PATH=. ./aidl-cpp" 
AIDL="../build/aidl-cpp" 

mkdir -p code

$AIDL -I. coco/ISensorData.aidl code data.cpp
$AIDL -I. coco/ISensorListener.aidl code listener.cpp

