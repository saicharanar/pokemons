#! /bin/bash
source scripts/create_html.sh
source scripts/create_pokemon_card.sh
source scripts/create_list.sh

PAGES_DIR="pokemon_pages"
mkdir -p ${PAGES_DIR}/css
cp -r images ${PAGES_DIR}/
cp css/styles.css ${PAGES_DIR}/css/

pokemons_data=$( tail -n+2 data/pokemon.csv )

main "${pokemons_data}"