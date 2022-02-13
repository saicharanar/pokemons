#! /bin/bash

source ../scripts/create_html.sh
source ~/bin/assert_result_and_generate_report.sh

function test_assemble_html () {
    #test_case 1
    local sidebar="grass"
    local articles="pikachu"
    local message="the sidebar and articles will be replace by grass and pikachu in the structure"
    local expected="<html>
    <head>
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="page">
            <nav class="sidebar">
            <ul>
                grass
            </ul>
            </nav>
            <main>
                pikachu
            </main>
        </div>
    </body>
    </html>"
    local actual=$( assemble_html "${sidebar}" "${articles}" )
    assert_result "${expected}" "${actual}" "${message}"
    
}

test_assemble_html
generate_report