#!/usr/local/bin/bash

PROGRAM="example1"

echo ""
echo "### This example demonstrates the normal two-step process to build an executable from a single source file"
echo "###   Step 1: Compile the single source file to create an intermediate object (\".o\") file"
echo "###   Step 2: Create an executable file from the object file"
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

run_command "Compile the source file, creating the object file ${PROGRAM}.o" "clang -c ${PROGRAM}.c"

list_directory_contents "Current"

run_command "Use the \"file\" command to inspect the object file" "file ${PROGRAM}.o"

run_command "Run the linker on the object file to create the executable file ${PROGRAM}" "clang ${PROGRAM}.o -o ${PROGRAM}"

list_directory_contents "Current"

run_command "Use the \"file\" command to inspect the executable file ${PROGRAM}" "file ${PROGRAM}"

run_command "Run the executable" "./${PROGRAM}"

run_command "Delete the object file" "rm ./${PROGRAM}.o"

run_command "Run the executable again (this shows that the object file isn't needed any more)" "./${PROGRAM}"

run_command "List the executable's undefined symbols:" "nm -gu ${PROGRAM}"

run_command "List the shared (dynamic) libraries that the executable depends on:" "otool -L ${PROGRAM}"

run_command "Delete the executable" "rm ./${PROGRAM}"
