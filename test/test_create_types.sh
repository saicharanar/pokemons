#! /bin/bash

source ../scripts/create_pokemon_card.sh
source ~/bin/assert_result_and_generate_report.sh

function test_create_types () {
    #test_case 1
    local file_content="__TYPE__"
    local types="grass"
    local message="the __TYPE__ will be replace by <div>Grass</div>"
    local expected="<div class=\"grass type\">Grass</div>"
    local actual=$( create_types "${file_content}" "${types}" )
    assert_result "${expected}" "${actual}" "${message}"

    #test_case 2
    local file_content="__TYPE__"
    local types="grass,poison"
    local message="the __TYPE__ will be replace by <div>Grass</div><div>Poison</div>"
    local expected="<div class=\"grass type\">Grass</div><div class=\"poison type\">Poison</div>"
    local actual=$( create_types "${file_content}" "${types}" )
    assert_result "${expected}" "${actual}" "${message}"

}

test_create_types
generate_report