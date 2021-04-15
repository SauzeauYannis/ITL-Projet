%%
DOSSIER                                     {printf("dossier");}
[0-9]{8}                                    {printf("codeDossier");}
([A-Z]+\-?[A-Z]*)*/([A-Z]+\-?[A-Z]*)*       {printf("prenomNom");}
T[0-9]{2,6}                                 {printf("codeConcert");}
\n                                          {printf("FL");}
([A-Z0-9]+\-?[A-Z0-9]*)*                    {printf("prenomNom");}
[0-2][0-9]/(1?[0-2])|(0?[1-9])(/[0-9]{2})?  {printf("date");}
([01][0-9])|(2[0-3]):[0-5][0-9]             {printf("heure");}
(" "|\t)*                                   {printf(" ");}
%%