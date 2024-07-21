**¡Malditos Git Squash!**

Este script se propone automatizar el squash en Git. El script pregunta el número de commits a squashear y abre vim para que elijas cuál es el commit escogido como base (básicamente, debes dejar uno en pick y poner 's' o 'squash' en el resto'). Después el script se encargará de hacer un push --force automáticamente.

Una vez clonado el script debes darle permisos para que sea ejecutable:

    chmod +x ~/git_squash.sh

Además de hacerlo ejecutable, lo suyo es que incluyas su ubicación en el path de tu sistema para poderlo ejecutar desde donde quieras. Para eso hay que configurar tu bash con tu editor de texto favorito, en mi caso, vim:

    vim ~/.bashrc

Allí añades esto

    export PATH="$HOME/scripts:$PATH"


Y para que el script sea fácil de ejecutar, le puedes poner un alias en el propio bash:

    alias gs='git_squash.sh'
