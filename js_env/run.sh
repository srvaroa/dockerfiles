#!/bin/bash

docker run --rm \
    -v $1:/src \
    -w /src \
    -p 8080:8080 \
    -t js_env \
    bash -c "npm install && npm run dev"
