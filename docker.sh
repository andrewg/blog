#!/bin/sh
config=_config.yml
if [ -f _config.override.yml ]; then
    config="$config,_config.override.yml"
fi
docker run --rm --volume "$PWD:/srv/jekyll" -it jekyll/builder:3.8 jekyll build --config $config
