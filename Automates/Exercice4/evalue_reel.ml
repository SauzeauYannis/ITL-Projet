(**
Retourne un tuple constitué de :
- la première lettre du mot passé en paramètre
- du mot passé en paramètre privé de sa première lettre
**)
let divisePremiereLettre(mot : string) : (char * string) =
  (mot.[0], String.sub mot 1 (String.length mot - 1))
;;

(** Transforme un caractère en réel **)
let float_of_char(c : char) : float =
  float_of_int ((int_of_char c) - (int_of_char '0'))
;;

(** Calcule le diviseur pour la partie décimale du réel **)
let calcDiviseur(deci : float) : float =
  10. ** float_of_int (String.length (string_of_float deci) - 1)
;;

(** Test si le caractère est un chiffre **)
let estUnChiffre(c : char) : bool =
  c >= '0' && c <= '9'
;;

let rec reconnaitRec_3(mot, reel, deci : string * float * float) : (bool * float) =
  if mot = ""
  then
    if reel < 0.
    then (true, reel -. (deci /. calcDiviseur(deci)))
    else (true, reel +. (deci /. calcDiviseur(deci)))
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then reconnaitRec_3(m, reel, 10. *. deci +. (float_of_char c))
    else (false, 0.)
;;

let rec reconnaitRec_2(mot, reel : string * float) : (bool * float) =
  if mot = ""
  then (false, 0.)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then
      if reel < 0.
      then reconnaitRec_2(m, 10. *. reel -. (float_of_char c))
      else reconnaitRec_2(m, 10. *. reel +. (float_of_char c))
    else
      if c = '.'
      then reconnaitRec_3(m, reel, 0.)
      else (false, 0.)
;;

let reconnaitRec_1(mot, reel : string * float) : (bool * float) =
  if mot = ""
  then (false, 0.)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then
      if reel < 0.
      then reconnaitRec_2(m, reel +. 1. -. (float_of_char c))
      else reconnaitRec_2(m, reel +. (float_of_char c))
    else (false, 0.)
;;

let reconnaitRec_0(mot : string ) : (bool * float) =
  if mot = ""
  then (false, 0.)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if c = '+'
    then reconnaitRec_1(m, 0.)
    else
      if c = '-'
      then reconnaitRec_1(m, -1.)
      else
        if estUnChiffre(c)
        then reconnaitRec_2(m, float_of_char c)
        else (false, 0.)
;;

let evalueRecReel(mot : string ) : (bool * float) =
  reconnaitRec_0(mot)
;;


let main() =
  let affichage mot =
    let (estReel, valeur) = evalueRecReel mot in
    if estReel
    then Format.printf "%s est bien un réel et a pour valeur %f\n" mot valeur
    else Format.printf "%s n'est pas un réel\n" mot
  in
  List.iter affichage
    [
      "123.";
      "123.45";
      "-123.";
      "+123.34";
      "-132.34";
      "12A3.34";
      "123..33";
      "123.34.44";
      ".34"
    ];
;;

main();;

