cmake_minimum_required(VERSION 2.8)

project(aidl_proto C CXX)

file(GLOB SRC_FILES
  src/*.cpp
  code/coco/*.cpp
)

set(binder_PATH $ENV{HOME}/workspace/hi3519a_adas_dms/thirdparty/debug/)
set(binder_INCLUDES ${binder_PATH}/include/)
set(binder_LIBRARIES ${binder_PATH}/lib/libbinder.so ${binder_PATH}/lib/libutils.so)


include_directories(${binder_INCLUDES} code/)

add_definitions(-std=c++11)

set(LIB ${PROJECT_NAME})
add_library(${LIB} SHARED ${SRC_FILES})
set_target_properties(${LIB} PROPERTIES
  LINK_FLAGS "-Wl,-z,defs")

target_link_libraries(${LIB} ${binder_LIBRARIES})
