%%
DOSSIER                                         {printf("dossier");}
places                                          {printf("places");}
[0-2][0-9]\/(1?[0-2])|(0?[1-9])(\/[0-9]{2})?    {printf("date");}
([01][0-9])|(2[0-3]):[0-5][0-9]                 {printf("heure");}
[1-9][0-9]?                                     {printf("nb");}
[0-9]{8}                                        {printf("codeDossier");}
([A-Z]+\-?[A-Z]*)*\/([A-Z]+\-?[A-Z]*)*          {printf("prenomNom");}
T[0-9]{2,6}                                     {printf("codeConcert");}
([A-Z0-9]+\-?[A-Z0-9]*)*                        {printf("prenomNom");}
(" "|\t)*                                       {printf(" ");}
\n                                              {printf(" FL\n");}
<<EOF>>                                         {printf("FinFichier\n"); yyterminate();}
%%
