#!/bin/bash

EXAMPLES_GIT_REPO="https://github.com/vgerm/ansible_advanced_examples.git"
USER_GIT=false
if [[ "${1}" == "--user-git" ]]; then
    USER_GIT=true
fi

# Global git configuration - ~/.gitconfig 
git_global_config(){
    local -r GIT_USER_NAME="${1}"
    local -r GIT_USER_EMAIL="${2}"

    git config --global url."https://github.com/".insteadOf git@github.com:
    git config --global url."https://".insteadOf git://
    git config --global credential.helper cache
    git config --global credential.helper 'cache --timeout=36000'
    git config --global user.name "$GIT_USER_NAME"
    git config --global user.email "$GIT_USER_EMAIL"
}

# START
read -p "Enter your name (e.g. Vladimir Germanov): " USER_NAME
if [[ -z "${USER_NAME}" ]]; then
    echo "You haven't specified your name!"
    exit 1
fi
read -p "Enter your EIT e-mail (e.g. vladimir@example.com): " USER_EMAIL
if [[ -z "${USER_EMAIL}" ]]; then
    echo "You haven't specified your EIT e-mail!"
    exit 1
fi
if [[ "$USER_GIT" == true ]]; then
    read -p "Enter your GIT repo: " USER_GIT_REPO
    if [[ -z "${USER_GIT_REPO}" ]]; then
        echo "You haven't specified your git repo!"
        exit 1
    fi
fi

git_global_config "${USER_NAME}" "${USER_EMAIL}"

cd /root/workspace
git clone "${EXAMPLES_GIT_REPO}" course_examples &> /dev/null
if [[ "$USER_GIT" == true ]]; then
    git clone "${USER_GIT_REPO}"
fi
