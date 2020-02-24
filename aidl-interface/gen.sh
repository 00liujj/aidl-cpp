set -ex

export LD_LIBRARY_PATH=.

mkdir -p code

./aidl-cpp -I. coco/ISensorData.aidl code data.cpp
./aidl-cpp -I. coco/ISensorListener.aidl code listener.cpp

