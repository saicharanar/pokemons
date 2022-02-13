function create_list () {
	local types=($1)
	local selected_type="$2"

	for type in ${types[@]}
	do
		local anchor_attrib=$( generate_attribute "href" "${type}.html" )
		if [[ ${selected_type} == ${type} ]]
		then
			anchor_attrib+=$( generate_attribute "class" "selected" )
			local list_attrib=$( generate_attribute "class" "${type}" )
		fi

		local anchor=$( generate_tag "a" "${anchor_attrib}" "${type}" )
		local list_items+=$( generate_tag "li" "${list_attrib}" "${anchor}" )
		list_attrib=""
	done
	echo "${list_items}"
}