#!/usr/local/bin/bash

PROGRAM="example7"
PRINT_HELLO="printHello"
PRINT_GOODBYE="printGoodbye"
PRINT_ARCHIVE_LIBRARY="printStuff.a"

echo ""
echo "### This example demonstrates how to pass the -g flag to clang."
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

run_command "Compile all the source files, creating all the object files" "clang -c -g *.c"

list_directory_contents "Current"

run_command "Create a static archive library with the print functions" "ar -rs ${PRINT_ARCHIVE_LIBRARY} ${PRINT_HELLO}.o ${PRINT_GOODBYE}.o"

run_command "Delete the print object files" "rm ${PRINT_HELLO}.o ${PRINT_GOODBYE}.o"

list_directory_contents "Current"

run_command "Run the linker to create the executable file ${PROGRAM}" "clang -g ${PROGRAM}.o ${PRINT_ARCHIVE_LIBRARY} -o ${PROGRAM}"

list_directory_contents "Current"

run_command "Run the executable" "./${PROGRAM}"

run_command "Delete the archive library and remaining object file" "rm *.o ${PRINT_ARCHIVE_LIBRARY}"

list_directory_contents "Current"

run_command "Run the executable again" "./${PROGRAM}"

run_command "List the executable's undefined symbols:" "nm -gu ${PROGRAM}"

run_command "List the shared (dynamic) libraries that the executable depends on:" "otool -L ${PROGRAM}"

run_command "Delete the executable" "rm ./${PROGRAM}"
