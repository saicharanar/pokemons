#! /bin/bash

source ../scripts/create_pokemon_card.sh
source ~/bin/assert_result_and_generate_report.sh

function test_substitute_data () {
    #test_case 1
    local data="Name=__NAME__"
    local substitute="__NAME__"
    local substituter="Pikachu"
    local message="the __NAME__ will be replace by Pikachu"
    local expected="Name=Pikachu"
    local actual=$( substitute_data "${data}" "${substitute}" "${substituter}" )
    assert_result "${expected}" "${actual}" "${message}"

    #test_case 2
    local data="ID=__ID__"
    local substitute="__ID__"
    local substituter="1"
    local message="the __ID__ will be replace by 1"
    local expected="ID=1"
    local actual=$( substitute_data "${data}" "${substitute}" "${substituter}" )
    assert_result "${expected}" "${actual}" "${message}"
}

test_substitute_data
generate_report