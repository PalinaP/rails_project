# README


* Ruby version :  '2.5.1'

--------------------------

TITRE : 

FreeDoc - Réserve ton docteur

--------------------------

ENNONCE DE L'EXERCICE :

1. Le pitch

Allez, on va implémenter pour de vrai ce concurrent de Doctolib dont on te parle à longueur de ressource ! À toi d'être chirurgical

2. Les models

Pour ce premier exercice, nous allons t'aider et te donner les models à créer :

    un model Doctor, qui a comme attributs :
        un first_name, qui est un string
        un last_name, qui est un string
        un specialty, qui est un string
        un zip_code, qui est un string
    un model Patient, qui a comme attributs :
        un first_name, qui est un string
        un last_name, qui est un string
    un model Appointment, qui a comme attributs :
        un date, qui est un datetime

Une fois les attributs fixés, on s'attaque aux relations :

    Un appointment ne peut avoir qu'un seul doctor, mais un doctor peut avoir plusieurs appointment.
    Un appointment ne peut avoir qu'un seul patient, mais un patient peut avoir plusieurs appointment.
    Un doctor peut avoir plusieurs patient, au travers des appointments, et vice versa.

Je t'invite à créer les models et les migrations puis à les passer.

3. Petit coup de boost

Ta startup de docteurs marche à merveille, tellement que tu aimerais ajouter plusieurs tables :

    city. Chaque docteur, patient, et rendez-vous est lié à une city. Une city peut avoir plusieurs docteurs, patients, et rendez-vous.
    tu voudrais virer la ligne specialty de ta table doctor et la remplacer par un model à part entière : tu vas donc créer un model specialty. Un docteur aurait plusieurs specialty (DEAL_WITH_IT), et une specialty pourrait concerner plusieurs doctor.

Comme d'hab tu vas tester et tu compléteras le seeds.rb pour prendre en compte ces changements.


--------------------------

LES DONNEES DU PROGRAMME :

=> *** les données sont crées via le fichier freedoc/db/seeds.rb

On créé:
> 5 cities
> 100 patients
> 5 specialties
> 30 doctors
> 300 appointments 
> entre 30 et 60 binôme doctor-specialty : un doctor peut avoir une ou deux spécialités, mais il ne peut pas avoir deux fois la même spécialité


On peut visualiser ces données en faisant dans la "rails console":
> tp City.all
> tp Patient.all
> tp Specialty.all
> tp Doctor.all
> tp Appointments.all
> tp JoinTableSpecialtyDoctor.all

--------------------------

COMMENT TESTER LE PROGRAMME :


=> *** on peut tester les relations entre classe avec l'exemple ci-dessous:
=> on cherche le nom de tous les patients qui ont des rdv dans la ville avec city_id:116

Rentrer dans la "rails console":
> patient_array = []       # on créé un array vide pour y stocker les patients
> app_c116_array = Appointment.where(city_id:116)   # on récupère tous les appointements qui ont lieu dans la ville city_id:116
> app_c116_array.each do |app| # on boucle sur chaque appointment
>   patient_array << Patient.find_by(id:app.patient_id) # on récupère chaque patient et on le stocke dans l'array
>  end
>patient_array.each do |p|  # on affiche le first_name et last_name de chaque patient
>	puts "#{p.first_name} #{p.last_name}"
>end








