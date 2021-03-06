(**
Retourne un tuple constitué de :
- la première lettre du mot passé en paramètre
- du mot passé en paramètre privé de sa première lettre
**)
let divisePremiereLettre(mot : string) : (char * string) =
  (mot.[0], String.sub mot 1 (String.length mot - 1))
;;

let reconnaitRec_4(mot : string) : bool =
  false
;;

let reconnaitRec_3(mot : string) : bool =
  mot = ""
;;

let rec reconnaitRec_2(mot : string) : bool =
  if mot = ""
  then reconnaitRec_4(mot)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if c = 'a'
    then reconnaitRec_3(m)
    else
      if c = 'c'
      then reconnaitRec_2(m)
      else reconnaitRec_4(mot)
;;

let rec reconnaitRec_1(mot : string) : bool =
  if mot = ""
  then reconnaitRec_2(mot)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if c = 'a'
    then reconnaitRec_3(m) || reconnaitRec_2(mot)
    else
      if c = 'b'
      then reconnaitRec_1(m) || reconnaitRec_2(mot)
      else reconnaitRec_2(mot)
;;

let reconnaitRec_0(mot : string) : bool =
  if mot = ""
  then reconnaitRec_4(mot)
  else
    let (c, m) = divisePremiereLettre(mot) in
    if c = 'a'
    then reconnaitRec_1(m) || reconnaitRec_2(m)
    else reconnaitRec_4(mot)
;;

let reconnaitRecL4(mot : string) : bool =
  reconnaitRec_0(mot)
;;

let main() =
  let affichage mot =
    if reconnaitRecL4 mot
    then Format.printf "%s appartient bien à L4\n" mot
    else Format.printf "%s n'appartient pas à L4\n" mot
  in
  List.iter affichage
    [
      "abbcca";
      "accca";
      "abbccccba";
    ];
;;

main();;

