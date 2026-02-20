docker run --rm \
        -v "jupyter_jupyter_data:/target" \
        -v .:/backup:ro \
        alpine sh -c "tar xzf /backup/brs_jupyter_data.tar.gz -C /target"

