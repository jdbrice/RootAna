# Sources: list explicitly (recommended) or use a glob if you prefer
file( GLOB MY_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")
file( GLOB MY_HEADERS "${CMAKE_CURRENT_SOURCE_DIR}/*.h" )


# OBJECT library (used to compose the combined lib)
add_library(RootAna_obj OBJECT ${MY_SOURCES} ${MY_HEADERS})
target_include_directories(RootAna_obj PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ ${CMAKE_SOURCE_DIR}/ )
target_link_libraries(RootAna_obj PUBLIC XmlConfig RooPlotLib)

# Actual library for this component
if(BUILD_SHARED_LIBS)
  add_library(RootAna SHARED $<TARGET_OBJECTS:RootAna_obj>)
else()
  add_library(RootAna STATIC $<TARGET_OBJECTS:RootAna_obj>)
endif()
target_include_directories(RootAna PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/ ${CMAKE_SOURCE_DIR}/)
target_link_libraries(RootAna PUBLIC XmlConfig RooPlotLib)

# Run root-config to get flags
execute_process(
  COMMAND root-config --cflags
  OUTPUT_VARIABLE ROOT_CFLAGS
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
execute_process(
  COMMAND root-config --libs
  OUTPUT_VARIABLE ROOT_LIBS
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

separate_arguments(ROOT_CFLAGS)
separate_arguments(ROOT_LIBS)

target_compile_options(RootAna PRIVATE ${ROOT_CFLAGS})
target_link_libraries(RootAna PRIVATE ${ROOT_LIBS})


