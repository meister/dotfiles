#!/usr/bin/env bash

CODE=code

if [ -z "$(command -v ${CODE})" ]; then
    echo "VS Code not found. Skipping."
    exit
fi

${CODE} --install-extension EditorConfig.editorconfig
${CODE} --install-extension ms-vscode.atom-keybindings
# ${CODE} --install-extension PeterJausovec.vscode-docker
${CODE} --install-extension dbaeumer.vscode-eslint
# ${CODE} --install-extension meistr.theme-snazzyfied
# ${CODE} --install-extension joshpeng.sublime-babel-vscode
# ${CODE} --install-extension joshpeng.theme-onedark-sublime
