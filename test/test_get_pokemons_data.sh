#! /bin/bash

source ../scripts/create_html.sh
source ~/bin/assert_result_and_generate_report.sh

function test_get_pokemons_data () {
    #test_case 1
    local pokemon_data="1|bulbasaur|grass,poison|44"
    local type="poison"
    local expected="1|bulbasaur|grass,poison|44"
    local message="Should give the pokemon data which has the following type"

    local actual=$( get_pokemons_data "${pokemon_data}" "${type}" )
    assert_result "${expected}" "${actual}" "${message}"

    #test_case 2
    local pokemon_data="1|bulbasaur|grass,poison|44\n2|ivysaur|dark|45"
    local type="dark"
    local expected="2|ivysaur|dark|45"
    local message="Should give the pokemon data which has the following type"

    local actual=$( get_pokemons_data "${pokemon_data}" "${type}" )
    assert_result "${expected}" "${actual}" "${message}"
}

test_get_pokemons_data
generate_report