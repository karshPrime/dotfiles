
#!/usr/env bash

if [ "$2" = "c" ]; then
    IDENTIFIER="C"
else
    IDENTIFIER="CXX"
fi

#- Create CMakeLists.txt files----------------------------------------------------------------------

echo "
cmake_minimum_required( VERSION 3.30 )

project( $1 VERSION 1.0 LANGUAGES $IDENTIFIER )

include_directories( include )
add_subdirectory( src )

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY \${CMAKE_BINARY_DIR}/build )
" > CMakeLists.txt


echo "
add_executable( \${PROJECT_NAME}
    main.$2
)

target_include_directories( \${PROJECT_NAME} PUBLIC \${PROJECT_SOURCE_DIR}/include )
" > ./src/CMakeLists.txt


#- build directory----------------------------------------------------------------------------------

cd ./build
cmake ..
make
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
cd ..

ln -s "./build/src/$1" "./bin"

