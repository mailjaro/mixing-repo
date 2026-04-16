pandoc mix_mast.md --standalone --highlight-style=espresso \
     --metadata-file=configs/common.yaml \
    --template=configs/template.html  --toc \
    -o builds/mix_mast.html -V css-path=styles/mix_mast.css \
    --embed-resources   

echo "✅ Pandoc HTML version successfully generated"