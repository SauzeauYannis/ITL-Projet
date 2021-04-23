(**
Retourne un tuple constitué de :
- la première lettre du mot passé en paramètre
- du mot passé en paramètre privé de sa première lettre
**)
let divisePremiereLettre(mot : string) : (char * string) =
  (mot.[0], String.sub mot 1 (String.length mot - 1))
;;

(** Test si le caractère est un chiffre **)
let estUnChiffre(c : char) : bool =
  c >= '0' && c <= '9'
;;

let rec reconnaitRec_3(mot : string) : bool =
  if mot = ""
  then true
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then reconnaitRec_3(m)
    else false
;;

let rec reconnaitRec_2(mot : string) : bool =
  if mot = ""
  then false
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then reconnaitRec_2(m)
    else
      if c = '.'
      then reconnaitRec_3(m)
      else false
;;

let reconnaitRec_1(mot : string) : bool =
  if mot = ""
  then false
  else
    let (c, m) = divisePremiereLettre(mot) in
    if estUnChiffre(c)
    then reconnaitRec_2(m)
    else false
;;

let reconnaitRec_0(mot : string) : bool =
  if mot = ""
  then false
  else
    let (c, m) = divisePremiereLettre(mot) in
    if c = '+' || c = '-'
    then reconnaitRec_1(m)
    else
      if estUnChiffre(c)
      then reconnaitRec_2(m)
      else false
;;

let reconnaitReelRec(mot : string) : bool =
  reconnaitRec_0(mot)
;;

let main() =
  let affichage mot =
    if reconnaitReelRec mot
    then Format.printf "%s est bien un réel\n" mot
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
  while (true)
  do
    print_string "Tapez un nombre pour vérifier si c'est un réel";
    print_newline();
    let mot = read_line() in
    affichage mot;
  done
;;

main();;

