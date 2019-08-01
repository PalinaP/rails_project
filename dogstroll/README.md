# README

* Ruby version :  '2.5.1'

--------------------------

TITRE : 

Le Airbnb des promenades de chiens

--------------------------

ENNONCE DE L'EXERCICE :

1. Le pitch

En cours de "Bizness Growth Money Maker", on t'avait demandé de créer une entreprise à fort potentiel. À l'époque tu t'étais dit que ce serait une chouette idée de faire une plateforme où des personnes pourraient promener les chiens des autres, en échange de cash-money.
!
2. Les models

À priori, les models sont simples : il y a un model dogsitter et un model dog (on te laisse choisir au moins un attribut chacun). Un dogsitter peut promener plusieurs dog lors d'une stroll (promenade, en anglais) ; et un dog peut avoir plusieurs dogsitter via les stroll.

Maintenant tu veux préciser la ville des promeneurs et des chiens pour faire un super algorithme de matching. Tu devras donc créer un model City avec comme attribut city_name. Chaque ville contient plusieurs promeneurs et plusieurs chiens mais un chien et un promeneur ne peuvent appartenir qu'a une ville.

Cela ressemble beaucoup à notre schéma de docteurs tout ceci ! C'est fait exprès, rien de tel pour s'entraîner que de refaire les exercices. Tu vas dérouler tes prochains model grâce à ça.

Comme la dernière fois : fait un seeds.rb et teste le tout en console.

--------------------------

DONNEES DU PROGRAMME :

=> *** les données sont crées via le fichier dogstroll/db/seeds.rb

On créé:
> 5 cities
> 30 dogs
> 70 dogsitters
> 200 strolls

On peut visualiser ces données en faisant dans la "rails console":
> tp City.all
> tp Dog.all
> tp Dogsitter.all
> tp Stroll.all


--------------------------

COMMENT TESTER LE PROGRAMME :


=> *** on peut tester les relations entre classe avec l'exemple ci-dessous:
=> on cherche le nom de tous les chiens s'étant promené dans la ville de New Antonioshire

Rentrer dans la "rails console":
> dog_name_array = []         # on créé un array vide pour y stocker le nom des chiens s'étant promené dans la ville de New Antonioshire 
> sna = Stroll.where(city_id:City.find_by(name:"New Antonioshire"))   # on récupère toutes les ballades à New Antonioshire
> sna.each do |s|    # on boucle sur chaque ballade à New Antonioshire
>   dog_name = Dog.find_by(id:s.dog_id).name     # on récupère le nom de chaque chien
>   dog_name_array << dog_name     # on stocke le nom de chaque chien dans un array
>   end
> puts dog_name_array     # on affiche le nom des chiens



