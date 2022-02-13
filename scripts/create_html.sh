function generate_nav_bar () {
	local sidebar="$1"

	local ul_element=$( generate_tag "ul" "" "${sidebar}" )
	local nav_attrib=$( generate_attribute "class" "sidebar" )
	local nav_bar=$( generate_tag "nav" "${nav_attrib}" "${ul_element}" )

	echo "${nav_bar}"
}

function generate_div_container () {
	local articles="$1"
	local nav_bar="$2"

	local main_content=$( generate_tag "main" "" "${articles}" )
	
	local div_content="${nav_bar} ${main_content}"
	local div_attrib=$( generate_attribute "class" "page" )
	local div_container=$( generate_tag "div" "${div_attrib}" "${div_content}" )

	echo "${div_container}"
}

function generate_head () {

	local link_attrib=$( generate_attribute "rel" "stylesheet" )
	link_attrib+=$( generate_attribute "href" "css/styles.css" )
	local link=$( generate_tag "link" "${link_attrib}" "" )
	local head=$( generate_tag "head" "" "${link}" )

	echo "${head}"
}

function create_page () {
	local sidebar="$1"
	local articles="$2"

	local head=$( generate_head )
	local nav_bar=$( generate_nav_bar "${sidebar}" )
	local div_container=$( generate_div_container "${articles}" "${nav_bar}" )
	local body=$( generate_tag "body" "" "${div_container}" )

	local content="${head} ${body}"
	local page=$( generate_tag "html" "" "${content}" )

	echo "${page}"
}

function create_files () {
    local assembled_output="$1"
    local type="$2"
    
    echo -e "${assembled_output}" > ${PAGES_DIR}/${type}.html
    echo "Created File ${type}.html"
}

function filter_all_types () {
    local all_pokemons_data="$1"
    local all_types=( $( echo -e "${all_pokemons_data}" | cut -f3 -d"|" | tr "," "\n" | sort | uniq ) )

    echo "${all_types[*]}"
}

function get_pokemons_data () {
    local all_pokemons_data="$1"
    local type="$2"

    if [[ ${type} == "all" ]] 
    then
        type=".*"
    fi
    local pokemons_data=($( echo -e "${all_pokemons_data}" | grep -i ".*|.*|.*${type}.*|.*" ))

    echo "${pokemons_data[*]}"
}

function get_pokemon_cards () {
    local pokemons_data=($1)
    local pokemon

    for pokemon in ${pokemons_data[@]}
    do
        local pokemon_cards+="$( create_pokemon_card "${pokemon}" )\n"
    done
    echo -e "${pokemon_cards}"
}

function create_website () {
    local all_pokemons_data="$1"
    local type
    
    echo "Generating Pokemon Pages.."
    local all_types=( all $( filter_all_types "${all_pokemons_data}" ) ) 

    for type in ${all_types[@]} 
    do
        local sidebar=$( create_list "${all_types[*]}" "${type}" )
        local pokemons_data=( $( get_pokemons_data "${all_pokemons_data}" "${type}" ) )
        local pokemon_cards=$( get_pokemon_cards "${pokemons_data[*]}")
        local pokemon_page=$( create_page "${sidebar}" "${pokemon_cards}" )

        create_files "${pokemon_page}" "${type}"
    done
}

function main () {
    local pokemons_data="$1"

    create_website "${pokemons_data}"
}