#! /bin/bash

source ../scripts/create_pokemon_card.sh
source ~/bin/assert_result_and_generate_report.sh

function test_create_pokemon_card () {
    #test_case 1
    local pokemon_data="1|pikachu|electric|40|45"
    local article_content="Id=__ID__,Name=__NAME__,Image=__IMAGE__,title=__NAME__,Type=__TYPE__,speed=__SPEED__,HP=__HP__"
    local message="the related '__Values__' will be changed according to the provided data"
    local expected="Id=1,Name=Pikachu,Image=images/pikachu.png,title=Pikachu,Type=<div class=\"electric type\">Electric</div>,speed=40,HP=45"
    local actual=$( create_pokemon_card "${article_content}" "${pokemon_data}" )
    assert_result "${expected}" "${actual}" "${message}"
    
}

test_create_pokemon_card
generate_report