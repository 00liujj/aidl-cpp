set -ex

true && ( DIR=`pwd`/bin
 mkdir -p ../build
 cd ../build/
 PATH=$DIR:$PATH cmake ../
 make
)

AIDL="LD_LIBRARY_PATH=. ./aidl-cpp" 
AIDL="../build/aidl-cpp" 

mkdir -p code

for fn in coco/*.aidl; do
  $AIDL -I. $fn code xxx
  clang-format-3.8 -i code/coco/$(basename $fn .aidl).h code/coco/$(basename $fn .aidl).cpp
done


