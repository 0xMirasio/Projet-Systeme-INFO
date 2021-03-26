# Projet-Systeme-INFO

Projet-Systeme-INFO est un projet dans le cadre de la formation ingénieur de l'INSA Toulouse. 

Le dépôt continent :

-Des règles regle.lex qui analyse un fichier C pour retrouver les tokens

-une grammaire grammaire.y qui à partir des tokens envoyés par regle.lex génère un code ASM correspondant au fichier example.c (code C minimaliste)

-TODO : processeur (VHDL)

-TODO : proco (FPGA)

## Installation

Package make needed to install Projet-Systeme-INFO.


```bash
sudo apt-get install make
```

Compilé et testé sur : ```Linux 5.4.0-70-generic #78~18.04.1-Ubuntu  ```


## Usage

Compilation et lancement du générateur pour le fichier example.c
```bash
make
```

Vider le dossier des fichiers automatiquement crées : 
```bash
make clean
```

## Contributing

Poncetta Thibault

Kévin Cavailles
