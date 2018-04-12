#!/bin/bash -x

docker run --rm \
    -v $1:/src \
    -w /src \
    -p 8080:8080 \
    -e HOST='0.0.0.0' \
    -t js_env \
    bash -c "npm install && npm run dev"
