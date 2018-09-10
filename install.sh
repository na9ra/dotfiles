#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  ln -snfv ~/dotfiles/"$f" ~/
done
