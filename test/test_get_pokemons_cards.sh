#! /bin/bash

source ../scripts/create_html.sh
source ~/bin/assert_result_and_generate_report.sh

function test_get_pokemons_cards () {

    #test_case 1
    local pokemons_data="1|pikachu|electric|40|45"
    local pokemon_template="Id=__ID__,Name=__NAME__,Image=__IMAGE__,title=__NAME__,Type=__TYPE__,speed=__SPEED__,HP=__HP__"
    local message="the related '__Values__' will be changed according to the provided data"
    local expected="Id=1,Name=Pikachu,Image=images/pikachu.png,title=Pikachu,Type=<div class=\"electric type\">Electric</div>,speed=40,HP=45"

    local actual=$( get_pokemons_cards "${pokemons_data}" "${pokemon_template}" )
    assert_result "${expected}" "${actual}" "${message}"

}

test_get_pokemons_cards
generate_report