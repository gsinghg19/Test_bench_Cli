#!/usr/bin/env bats
# Written by Gurpreet Singh v0.1
# 2023-01-25
load '../node_modules/bats-support/load'
load '../node_modules/bats-assert/load'

@test "testign to see if bats is working" {
    # Arrange
    # Prepare "the world" for your test

    # Act
    # Run your code
    result="$(echo 2+2 | bc)"

    # Assert
    # Make assertions to ensure that the code does what it should
    [ "$result" -eq 4 ]
    assert_equal "$result" 4
}

setup() {
    # get the containing directory of this file
    # use $BATS_TEST_FILENAME instead of ${BASH_SOURCE[0]} or $0,
    # as those will point to the bats executable's location or the preprocessed file respectively
    DIR="$(cd "$(dirname "$BATS_TEST_FILENAME")" >/dev/null 2>&1 && pwd)"
    # make executables in scripts/ visible to PATH
    PATH=$DIR"/Users/gurpreetsingh/Desktop/Test_bench_cli/scripts:$PATH"
}

@test "can run our script" {
    scripts/cathode.sh
}

@test "Run scripts successfully" {

    # Run our script.
    # We use $BATS_TEST_DIRNAME here, as the tests
    # are executed in a temporary directory. The
    # variable gives us the absolute path to
    # the testing directory

    #run the cathode.sh file
    run "${BATS_TEST_DIRNAME}"/../scripts/

    # Assert that the script has run successfully
    assert_success
}
