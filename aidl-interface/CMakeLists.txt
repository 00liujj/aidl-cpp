cmake_minimum_required(VERSION 2.8)

project(aidl-cs C CXX)

file(GLOB SRC_FILES
  code/coco/*.cpp
  code/coco/*.h
)

include_directories($ENV{HOME}/workspace/hi3519a_adas_dms/thirdparty/debug/include/ code/)

add_definitions(-std=c++11)

add_library(aidl-cs ${SRC_FILES})

