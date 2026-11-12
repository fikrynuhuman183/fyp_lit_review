#!/usr/bin/env bash
# Rebuilds main.pdf every time main.tex, references.bib or a figure is saved.
# Run:  ./watch.sh     Stop: Ctrl+C
cd "$(dirname "$0")" || exit 1
trap 'latexmk -c >/dev/null 2>&1; rm -f main.bbl' EXIT   # tidy temporary files on exit
latexmk -pdf -pvc -view=none -interaction=nonstopmode main.tex
