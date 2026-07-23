#!/bin/bash

limpar() {
    echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | \
    sed 'y/áàâãäéèêëíìîïóòôõöúùûüç/aaaaaeeeeiiiiooooouuuuc/' | \
    sed 's/[^a-z0-9.-]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

find . -depth -name "*" | while read item; do
    dir=$(dirname "$item")
    antigo=$(basename "$item")
    novo=$(limpar "$antigo")
    
    if [ "$antigo" != "$novo" ] && [ "$novo" != "" ]; then
        mv -v "$item" "$dir/$novo"
    fi
done
