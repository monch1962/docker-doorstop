docker run --name doorstop --rm \
    -v "$(pwd)/data:/data" \
    -p 7867:7867 \
    -i -t doorstop_image
