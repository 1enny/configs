#!/usr/bin/env bash

if which composer >/dev/null; then
    echo ">>> Installing Composer"

    # Composer
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
    echo "PATH=$PATH:/usr/local/bin/" > ~/.profile
else
    echo ">>> Composer exists in system!"
fi;
