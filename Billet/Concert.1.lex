chiffre     [0-9]
majuscule   [A-Z]
majOuChif   {majuscule}|{chiffre}
nom         {majuscule}+("-"?{majuscule}+)?
jour        [0-2]{chiffre}
mois        (1?[0-2])|(0?[1-9])
annee       {chiffre}{2}
heure       (([01]{chiffre})|(2[0-3]))
minute      [0-5]{chiffre}  
%%
^DOSSIER                            {printf("dossier");}
{chiffre}{8}                        {printf("codeDossier");}
^{nom}*"/"{nom}*                    {printf("prenomNom");}
^T{chiffre}{2,6}                    {printf("codeConcert");}
[1-9]{chiffre}?                     {printf("nb");}
({majOuChif}+("-"{majOuChif})?)*    {printf("nomConcert");}
{jour}"/"{mois}("/"{annee})?        {printf("date");}
{heure}:{minute}                    {printf("heure");}
places                              {printf("places");}
(" "|\t)*                           {printf(" ");}
\n                                  {printf(" FL\n");}
<<EOF>>                             {printf("FinFichier\n"); yyterminate();}
%%
