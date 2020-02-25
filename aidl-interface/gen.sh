set -ex

true && (
  DIR=`pwd`/bin
  mkdir -p ../build
  cd ../build/
  PATH=$DIR:$PATH cmake ../
  make -j2
)

AIDL="../build/aidl-cpp" 

mkdir -p code

for fn in coco/I*.aidl; do
  $AIDL -I. $fn code xxx
done

clang-format-3.8 -i code/coco/*.h code/coco/*.cpp


