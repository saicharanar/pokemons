#! /bin/bash

source ../scripts/create_pokemon_card.sh
source ~/bin/assert_result_and_generate_report.sh

function test_get_field () {
    #test_case 1
    local field="2"
    local message="Should cut the second field of the data and gives pikachu"
    local expected="pikachu"
    local actual=$( get_field "${data}" "${field}" )
    assert_result "${expected}" "${actual}" "${message}"

    #test_case 2
    local field="3"
    local message="Should cut the second field of the data and gives electric"
    local expected="electric"
    local actual=$( get_field "${data}" "${field}" )
    assert_result "${expected}" "${actual}" "${message}"
}

function test_get_id () {
    #test_case 1
    local message="Should cut the first field of the data and gives id"
    local expected="1"
    local actual=$( get_id "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_name () {
    #test_case 1
    local message="Should cut the second field of the data and gives name"
    local expected="pikachu"
    local actual=$( get_name "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_types () {
    #test_case 1
    local message="Should cut the third field of the data and gives types"
    local expected="electric"
    local actual=$( get_types "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

# function test_get_types () {
#     #test_case 1
#     local message="Should cut the third field of the data and gives types"
#     local expected="electric"
#     local actual=$( get_types "${data}")
#     assert_result "${expected}" "${actual}" "${message}"

# }

function test_get_speed () {
    #test_case 1
    local message="Should cut the ninth field of the data and gives speed"
    local expected="45"
    local actual=$( get_speed "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_HP () {
    #test_case 1
    local message="Should cut the sixth field of the data and gives HP"
    local expected="45"
    local actual=$( get_HP "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_base_xp () {
    #test_case 1
    local message="Should cut the fifth field of the data and gives base_xp"
    local expected="64"
    local actual=$( get_base_xp "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_attack () {
    #test_case 1
    local message="Should cut the seventh field of the data and gives attack"
    local expected="49"
    local actual=$( get_attack "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_defense () {
    #test_case 1
    local message="Should cut the eight field of the data and gives defense"
    local expected="49"
    local actual=$( get_defense "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}

function test_get_weight () {
    #test_case 1
    local message="Should cut the forth field of the data and gives weight"
    local expected="69"
    local actual=$( get_weight "${data}")
    assert_result "${expected}" "${actual}" "${message}"

}


function all_test_cases () {
    local data="1|pikachu|electric|45|45|64|49|49|69"
    echo -e "test for get_field\n"
    test_get_field
    generate_report

    echo -e "test for get_id\n"
    test_get_id
    generate_report

    echo -e "test for get_name\n"
    test_get_name
    generate_report

    echo -e "test for get_types\n"
    test_get_types
    generate_report

    echo -e "test for get_weight\n"
    test_get_weight
    generate_report

    echo -e "test for get_base_xp\n"
    test_get_base_xp
    generate_report

    echo -e "test for get_HP\n"
    test_get_HP
    generate_report

    echo -e "test for get_attack\n"
    test_get_attack
    generate_report

    echo -e "test for get_defense\n"
    test_get_defense
    generate_report

    echo -e "test for get_speed\n"
    test_get_speed
    generate_report
}

all_test_cases