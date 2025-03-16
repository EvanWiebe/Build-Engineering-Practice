#!/usr/local/bin/bash

PROGRAM="example5"
PRINT_HELLO="printHello"

echo ""
echo "### This example demonstrates how to use a header file to declare the printHello() function."
echo ""

run_command () {
    COMMENT=$1
    COMMAND=$2
    
    echo "# $COMMENT"
    echo ">>> $COMMAND"
    $COMMAND
    echo ""
}

list_directory_contents () {
    STATE=$1
    echo "# $STATE directory contents:"
    ls
    echo ""
}

list_directory_contents "Initial"

run_command "Contents of ${PROGRAM}.c:" "cat ${PROGRAM}.c"
run_command "Contents of ${PRINT_HELLO}.h:" "cat ${PRINT_HELLO}.h"
run_command "Contents of ${PRINT_HELLO}.c:" "cat ${PRINT_HELLO}.c"


run_command "Compile the source files, creating the object file ${PROGRAM}.o" "clang -c *.c"

list_directory_contents "Current"

run_command "Run the linker on the object files to create the executable file ${PROGRAM}" "clang *.o -o ${PROGRAM}"

list_directory_contents "Current"

run_command "Run the executable" "./${PROGRAM}"

run_command "Delete the object files" "rm *.o"

run_command "Delete the executable" "rm ./${PROGRAM}"
