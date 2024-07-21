#!/bin/bash

# Pregunta al usuario el número de commits que quiere squashar
read -p "¿Cuántos commits quieres squashar? " num_commits

# Pregunta al usuario el mensaje del commit resultante
read -p "Introduce el mensaje del commit resultante: " commit_message

# Verifica que el número de commits es un número positivo
if ! [[ "$num_commits" =~ ^[0-9]+$ ]] ; then
   echo "Error: El número de commits debe ser un número positivo."
   exit 1
fi

# Establece Vim como editor para el rebase interactivo
export GIT_EDITOR=vim

# Ejecuta el rebase interactivo para squashar los commits
git rebase -i HEAD~$num_commits

# Aquí el usuario debe cambiar manualmente "pick" por "squash" en Vim y cerrar el editor

# Una vez cerrado Vim, ejecuta el commit amend con el mensaje del commit proporcionado por el usuario
git commit --amend -m "$commit_message"

# Continúa con el rebase
git rebase --continue

# Pregunta al usuario si quiere hacer un push force para actualizar el repositorio remoto
read -p "¿Quieres hacer un push force para actualizar el repositorio remoto? (s/n): " push_force

if [ "$push_force" = "s" ]; then
    git push --force
    echo "Push force realizado."
else
    echo "No se ha realizado el push force. Recuerda hacer push force manualmente si es necesario."
fi

