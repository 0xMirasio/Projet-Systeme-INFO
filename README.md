# Projet-Systeme-INFO

Projet-Systeme-INFO est un projet dans le cadre de la formation ingénieur de l'INSA Toulouse. 

Le dépôt contient :

-Des règles regle.lex qui analyse un fichier C pour retrouver les tokens

-une grammaire grammaire.y qui à partir des tokens envoyés par regle.lex génère un code ASM correspondant au fichier example.c (code C minimaliste)

processeur (VHDL) + implémentation FPGA : Voir branche ``` processeur ```

## Installation

Package make needed to install Projet-Systeme-INFO.


```bash
sudo apt-get install make
```

Compilé et testé sur : ```
Linux 5.4.0-70-generic #78~18.04.1-Ubuntu
make 4.1
Bison 3.0.4
flex 2.6.4```


## Usage

Compilation du générateur et interpréteur
```bash
make
```

lancement du générateur (in: example.c , out:input.txt) puis lancement intépreteur (in : input.txt)
```bash
make run
```

Vider le dossier des fichiers automatiquement crées : 
```bash
make clean
```

## Contributing

Poncetta Thibault

Kévin Cavailles
