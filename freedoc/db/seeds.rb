# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.destroy_all
5.times do 
	City.create(
		name:Faker::Address.city
	)
end


Patient.destroy_all
100.times do 
	Patient.create(
		first_name:Faker::Name.first_name,
		last_name:Faker::Name.last_name,
		city:City.find(rand(City.first.id..City.last.id))
	)
end


Specialty.destroy_all
specialties = [] # on stocke toutes les spécialités dans un array pour générer la table JoinTableSpecialtyDoctor
specialties << Specialty.create(name:"generalist")
specialties << Specialty.create(name:"gyneco")
specialties << Specialty.create(name:"dentist")
specialties << Specialty.create(name:"kine")
specialties << Specialty.create(name:"dermato")


Doctor.destroy_all
doctors = [] # on stocke tous les médecins dans un array pour générer la table JoinTableSpecialtyDoctor
30.times do 
     doctors << Doctor.create(
		first_name:Faker::Name.first_name,
		last_name:Faker::Name.last_name,
		city:City.find(rand(City.first.id..City.last.id))
	)
end




Appointment.destroy_all
300.times do
	Appointment.create(
		city:City.find(rand(City.first.id..City.last.id)),
		doctor:Doctor.find(rand(Doctor.first.id..Doctor.last.id)),
		patient:Patient.find(rand(Patient.first.id..Patient.last.id))
	)
end


JoinTableSpecialtyDoctor.destroy_all
# Un médecin une ou deux spécialités. Un médecin ne peut pas avoir deux fois la même spécialité.

doctors.each do |d|
	n = rand(1..2)
	specialty_ini = ''
	specialty_final = ''
	n.times do
		while specialty_final == specialty_ini
			specialty_final = specialties.sample
		end
		specialty_ini = specialty_final
		JoinTableSpecialtyDoctor.create(
			doctor:d,
			specialty:specialty_final
		)
	end
end







