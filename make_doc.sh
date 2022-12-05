#!/bin/sh

# If no file is passed, build LESSON.md
if [[ -n "$@" ]]; then
    echo "Consider several files."
    files=($@)
else
    echo "Consider LESSON.md"
    files=("LESSON.md")
fi

all=""
for file in "${files[@]}"; do
    # Remove extension.
    f="${file%.*}"
    # Replace / by -
    all="${all}_${f/\//-}"
done
echo "Concatenate all passed files in ${all}.tmp.md"
cat ${files[@]} > "${all}.tmp.md"

echo "Build."
pandoc --defaults docs/config_pdf.yaml --webtex --pdf-engine=xelatex -o ${all}.pdf ${all}.tmp.md

echo "The built file is: ${all}.pdf"
