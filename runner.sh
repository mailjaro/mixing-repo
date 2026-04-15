pandoc mix_mast.md --standalone --highlight-style=espresso \
     --metadata-file=common.yaml \
    --template=template.html  --toc \
    -o mix_mast.html -V css-path=mix_mast.css \
    --embed-resources   

echo "✅ Pandoc HTML version successfully generated"