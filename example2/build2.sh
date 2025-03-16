#!/usr/local/bin/bash

PROGRAM="example2"

echo ""
echo "### This example shows compiling a single source file directly to an executable file in a single step."
echo ""
echo "### This example produces the same result as example1, but the compiler driver automatically"
echo "### creates, uses, and then deletes the intermediate object (\".o\") file."
echo ""
echo "### NOTE: This example is only meant to show that it's possible to compile directly to the executable."
echo "###       You would only do this in the simplest cases, where there are only one or two source files."
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

run_command "Compile the source file directly to executable file ${PROGRAM}" "clang -o ${PROGRAM} ${PROGRAM}.c"

list_directory_contents "Current"

run_command "Use the \"file\" command to inspect the executable file ${PROGRAM}" "file ${PROGRAM}"

run_command "Run the executable" "./${PROGRAM}"

run_command "Delete the object file" "rm ./${PROGRAM}.o"

run_command "Run the executable again (this shows that the object file isn't needed any more)" "./${PROGRAM}"

run_command "List the executable's undefined symbols:" "nm -gu ${PROGRAM}"

run_command "List the shared (dynamic) libraries that the executable depends on:" "otool -L ${PROGRAM}"

run_command "Delete the executable" "rm ./${PROGRAM}"
