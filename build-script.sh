#!/bin/sh
set -e

if ! id -nG "$USER" | grep -qw "docker"
    then alias docker="sudo docker";
fi

echoc() {
    echo "\033[0;36m"$1"\033[0m"
}

build() {
        if test -z $BASE; then
                PULL="--pull"
        else
                OLDPATH=$(pwd)
                cd ../$(echo $BASE | sed 's/:latest//g' | sed 's/:/-/g')
                sh build.sh
                cd $OLDPATH
        fi

    echoc "Building $NAME:$VERSION"
        docker build $PULL -t $NAME:$VERSION ./
        echo
}