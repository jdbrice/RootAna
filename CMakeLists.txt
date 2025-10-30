cmake_minimum_required(VERSION 3.10)
project(RootAna)

file(GLOB SRC_FILES CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
add_library(RootAna SHARED ${SRC_FILES})

# find_library(TaskEngine_Lib
#     NAMES TaskEngine
#     HINTS ${CMAKE_SOURCE_DIR}/../TaskEngine/build ${CMAKE_SOURCE_DIR}/TaskEngine/build
#     NO_DEFAULT_PATH
# )
# message(STATUS "Found XmlConfig: ${TaskEngine_Lib}")
# target_link_libraries(RootAna PRIVATE ${TaskEngine_Lib})

target_compile_options(RootAna PRIVATE "-m32")
target_link_libraries(RootAna PRIVATE "-m32")

target_include_directories(RootAna PRIVATE
  ${CMAKE_SOURCE_DIR}/XmlConfig
  ${CMAKE_SOURCE_DIR}/RooPlotLib
  ${CMAKE_SOURCE_DIR}/TaskEngine
  ${CMAKE_SOURCE_DIR}/
)
set_property(TARGET RootAna PROPERTY CXX_STANDARD 11)