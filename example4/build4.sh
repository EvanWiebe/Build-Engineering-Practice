#!/usr/local/bin/bash

PROGRAM="example4"
PRINT_HELLO="printHello"

echo ""
echo "### This example demonstrates what happens if the printHello() function is not declared in ${PROGRAM}.c."
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

run_command "Compile the ${PROGRAM}.c source file, creating the object file ${PROGRAM}.o" "clang -c ${PROGRAM}.c"
