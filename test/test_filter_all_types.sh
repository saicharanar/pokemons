#! /bin/bash

source ../scripts/create_html.sh
source ~/bin/assert_result_and_generate_report.sh

function test_filter_all_types () {
    #test_case 1
    local pokemon_data="1|bulbasaur|grass,poison|44"
    local expected="grass poison"
    local message="Should cut the types field and sort and uniq them"

    local actual=$( filter_all_types "${pokemon_data}" )
    assert_result "${expected}" "${actual}" "${message}"
    
    #test_case 2
    local pokemon_data="1|bulbasaur|grass,poison|44\n2|ivysaur|dark|45"
    local expected="dark grass poison"
    local message="Should cut the types field and sort and uniq them"

    local actual=$( filter_all_types "${pokemon_data}" )
    assert_result "${expected}" "${actual}" "${message}"
    
}

test_filter_all_types
generate_report