#! /bin/bash

source ../scripts/create_list.sh
source ~/bin/assert_result_and_generate_report.sh

function test_create_list () {
    #test_case 1
    local all_types="grass poison"
    local message="the list element with given data 'grass and posion' will be created with links"
    local expected="<li><a href=\"grass.html\">grass</a></li>\n\t<li><a href=\"poison.html\">poison</a></li>\n\t"
    local actual=$( create_list "${all_types}" )
    assert_result "`echo -e ${expected}`" "${actual}" "${message}"

    #test_case 2
    local all_types="Grass Poison Dark Water"
    local message="the list element with given data 'grass,poison,dark and water' will be created with links"
    local expected="<li><a href=\"Grass.html\">Grass</a></li>\n\t<li><a href=\"Poison.html\">Poison</a></li>\n\t<li><a href=\"Dark.html\">Dark</a></li>\n\t<li><a href=\"Water.html\">Water</a></li>\n\t"
    local actual=$( create_list "${all_types}" )
    assert_result "`echo -e ${expected}`" "${actual}" "${message}"


}

test_create_list
generate_report