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


Dog.destroy_all
30.times do
	Dog.create(
		name:Faker::Creature::Dog.name,
		race:Faker::Creature::Dog.breed,
		gender:Faker::Creature::Dog.gender,
		age:Faker::Creature::Dog.age,
		city:City.find(rand(City.first.id..City.last.id))
)
end


Dogsitter.destroy_all
70.times do
	Dogsitter.create(
		first_name:Faker::Name.first_name,
		last_name:Faker::Name.last_name,
		gender:Faker::Gender.binary_type,
		age:Faker::Number.within(range: 18..85),
		city:City.find(rand(City.first.id..City.last.id))
)
end


Stroll.destroy_all
200.times do
	Stroll.create(
		dogsitter:Dogsitter.find(rand(Dogsitter.first.id..Dogsitter.last.id)),	
		dog:Dog.find(rand(Dog.first.id..Dog.last.id)),	
		city:City.find(rand(City.first.id..City.last.id))		
)
end

