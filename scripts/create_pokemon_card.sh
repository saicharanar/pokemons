function generate_attribute() {
  if [[ -z $2 ]];
  then
    echo ""
    return
  fi

  echo "${1}=\"${2}\""
}

function generate_tag() {
  local tag=$1
  local attributes="${2}"
  local content="${3}"

  echo "<${tag} ${attributes}>${content}</${tag}>"
}

function get_field {
    cut -d"|" -f${2} <<< $1
}

function get_id {
    get_field $1 1
}

function get_name {
    get_field $1 2
}

function get_types {
    get_field $1 3
}

function get_weight {
    get_field $1 9
}

function get_base_xp {
    get_field $1 6
}

function get_HP {
    get_field $1 5
}

function get_attack {
    get_field $1 7
}

function get_defense {
    get_field $1 8
}
function get_speed {
    get_field $1 4
}

function capitalize_first_letter () {
    local text="$1"

    text="$(tr '[:lower:]' '[:upper:]' <<< ${text:0:1})${text:1}"
    echo "${text}"
}

function generate_header () {
    local IFS=$','
    local name="$1"
    local types=($2)
    local type

    name=$( capitalize_first_letter "${name}" )
    local content=$( generate_tag "h1" "" "${name}" )
    
    for type in ${types[@]}
    do  
        type=$( capitalize_first_letter "${type}" )
        local type_attributes=$( generate_attribute "class" "${type} type" )
        local div_content+=$( generate_tag "div" "${type_attributes}" "${type}" )
    done

    local div_attribute=$( generate_attribute "class" "types" )
    content+=$( generate_tag "div" "${div_attribute}" "${div_content}" )
    local header=$(generate_tag "header" "" "${content}")

    echo "${header}"
}

function generate_table_content () {
    local thead="$1"
    local tdata="$2"

    local row_head=$( generate_tag "th" "" "${thead}" )
    local row_data=$( generate_tag "td" "" "${tdata}" )
    local row_content=" "${row_head}" "${row_data}" "
    local table_row=$( generate_tag "tr" "" "${row_content}" )

    echo "${table_row}"
}

function generate_table () {
    local stat_values=($1)
    local stats=( "Weight" "Base XP" "HP" "Attack" "Defense" "Speed" )

    local index=0
    local last_index=$(( ${#stats[@]} - 1 ))
    while [[ ${index} -le ${last_index} ]]
    do
        local table_content+=$( generate_table_content "${stats[$index]}" "${stat_values[$index]}" )
        index=$(( ${index} + 1 ))
    done

    local table_attribute=$( generate_attribute "class" "stats" )
    local table=$( generate_tag "table" "${table_attribute}" "${table_content}" )

    echo "${table}"
}

function extract_stats () {
    local pokemon_data="$1"
    local stats

    stats[0]=$( get_weight "${pokemon_data}" )
    stats[1]=$( get_base_xp "${pokemon_data}" )
    stats[2]=$( get_HP "${pokemon_data}" )
    stats[3]=$( get_attack "${pokemon_data}" )
    stats[4]=$( get_defense "${pokemon_data}" )
    stats[5]=$( get_speed "${pokemon_data}" )

    echo "${stats[*]}"
}

function generate_section () {
    local pokemon_data="$1"

    local name=$( get_name "${pokemon_data}" )
    local types=$( get_types "${pokemon_data}" )
    local stats=($( extract_stats "${pokemon_data}" ))

    local header=$( generate_header "${name}" "${types}" )
    local table=$( generate_table "${stats[*]}")

    local section_content="${header}${table}"
    local section_attributes="$( generate_attribute "class" "info" )"
    local section=$(generate_tag "section" "${section_attributes}" "${section_content}")

    echo "${section}"
}

function generate_figure () {
    local pokemon_data="$1"
    local name=$( get_name "${pokemon_data}" )

    local attributes=$(generate_attribute "src" "images/${name}.png")
    attributes+=" $(generate_attribute "alt" "${name}")"
    attributes+=" $(generate_attribute "title" "${name}")"
    local figure_content=$( generate_tag "img" "${attributes}" "" )

    local figure_attributes=$( generate_attribute "class" "pokemon-image" )
    local figure=$(generate_tag "figure" "${figure_attributes}" "${figure_content}")

    echo "${figure}"
}

function create_pokemon_card () {
    local pokemon_data="$1"

    local figure=$( generate_figure "${pokemon_data}")
    local section=$( generate_section "${pokemon_data}" )
    local article_content="${figure}${section}"

    local article_attributes=$( generate_attribute "class" "pokemon" )
    local pokemon_card=$(generate_tag "article" "${article_attributes}" "${article_content}")

    echo "${pokemon_card}"
}