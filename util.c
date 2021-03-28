#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "util.h"

#define TAILLE_MAX 2000

void init() {
	system("echo '' > output_code");
}

void save_line(char* data){
	char cmd[50];
	sprintf(cmd, "echo '%s' >> output_code" , data);
	system(cmd);
}

void print_output() {
	printf("ASM OUTPUT : \n");
    FILE* fichier = NULL;
	char chaine[TAILLE_MAX] = "";
    fichier = fopen("output_code", "r+");
	if (fichier != NULL)
    {
		while (fgets(chaine, TAILLE_MAX, fichier) != NULL) {
			printf("%s", chaine);
		}
        fclose(fichier); 
    }
}
