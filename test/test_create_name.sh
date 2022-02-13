#! /bin/bash

source ../scripts/create_pokemon_card.sh
source ~/bin/assert_result_and_generate_report.sh

function test_create_name () {
    #test_case 1
    local file_content="__NAME__"
    local name="Pikachu"
    local message="the __NAME__ will be replace by Pikachu"
    local expected="Pikachu"
    local actual=$( create_name "${file_content}" "${name}" )
    assert_result "${expected}" "${actual}" "${message}"

    #test_case 2
    local file_content="<h1>__NAME__</h1>"
    local name="Pikachu"
    local message="the __NAME__ will be replace by Pikachu"
    local expected="<h1>Pikachu</h1>"
    local actual=$( create_name "${file_content}" "${name}" )
    assert_result "${expected}" "${actual}" "${message}"
}

test_create_name
generate_report