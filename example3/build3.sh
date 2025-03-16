#!/usr/local/bin/bash

PROGRAM="example3"
PRINT_HELLO="printHello"

echo ""
echo "### This example demonstrates the normal two-step process to build an executable from two source files."
echo "###   Step 1: Compile the source files to create intermediate object (\".o\") files"
echo "###   Step 2: Create an executable file from the object files"
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

run_command "Contents of ${PRINT_HELLO}.c:" "cat ${PRINT_HELLO}.c"

run_command "Compile the ${PROGRAM}.c source file, creating the object file ${PROGRAM}.o" "clang -c ${PROGRAM}.c"

run_command "Compile the ${PRINT_HELLO}.c source file, creating the object file ${PRINT_HELLO}.o" "clang -c ${PRINT_HELLO}.c"

list_directory_contents "Current"

run_command "Use the \"file\" command to inspect the object files" "file *.o"

run_command "Run the linker on the object files to create the executable file ${PROGRAM}" "clang *.o -o ${PROGRAM}"

list_directory_contents "Current"

run_command "Use the \"file\" command to inspect the executable file ${PROGRAM}" "file ${PROGRAM}"

run_command "Run the executable" "./${PROGRAM}"

run_command "Delete the object files" "rm *.o"

run_command "Run the executable again (this shows that the object file isn't needed any more)" "./${PROGRAM}"

run_command "List the executable's undefined symbols:" "nm -gu ${PROGRAM}"

run_command "List the shared (dynamic) libraries that the executable depends on:" "otool -L ${PROGRAM}"

run_command "Delete the executable" "rm ./${PROGRAM}"
