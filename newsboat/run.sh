#!/bin/bash
#
# - Add a volume with the host's ~/.newsboat
# - Add a volume with Repocket's credentials (see https://github.com/srvaroa/repocket)
docker run -it --rm -v ~/.newsboat:/root/.newsboat -v ~/.repocket:/root/.repocket newsboat
