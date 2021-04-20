%{
    char * codeDossier;
    char * prenomNom;
    int nbPlaces;
    int nbConcert;
%}
chiffre     [0-9]
majuscule   [A-Z]
majOuChif   {majuscule}|{chiffre}
nom         {majuscule}+("-"{majuscule}+)?
jour        (([0-2]{chiffre})|(3[01]))
mois        (1?[0-2])|(0?[1-9])
annee       {chiffre}{2}
heure       (([01]{chiffre})|(2[0-3]))
minute      [0-5]{chiffre}  
%%
^DOSSIER                            {}
{chiffre}{8}                        {
                                        int memory_size = yyleng * sizeof(char);
                                        codeDossier = (char *) malloc(memory_size);
                                        strncpy(codeDossier, yytext, memory_size);
                                    }
^{nom}*"/"{nom}*                    {
                                        int memory_size = yyleng * sizeof(char);
                                        prenomNom = (char *) malloc(memory_size);
                                        strncpy(prenomNom, yytext, memory_size);
                                    }
^T{chiffre}{2,6}                    {}
[1-9]{chiffre}?                     {nbPlaces += atoi(yytext);}
({majOuChif}+("-"{majOuChif})?)*    {}
{jour}"/"{mois}("/"{annee})?        {}
{heure}:{minute}                    {}
places                              {nbConcert++;}
(" "|\t)*                           {}
\n                                  {}
<<EOF>>                             {yyterminate();}
%%
int main() {
    nbPlaces = 0;
    nbConcert = 0;
    
    yylex();

    printf("Pour le dossier %s, %s a acheté %d places de %d concerts\n", codeDossier, prenomNom, nbPlaces, nbConcert);

    return EXIT_SUCCESS;
}
