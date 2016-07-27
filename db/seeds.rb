# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Renter.create!(first_name: "Juan",
               second_name: "Andrés",
               first_last_name: "Silva",
               second_last_name: "Gallardo",
               mobile: "56987716320",
               landline: " ",
               email: "juansilva@gmail.com",
               password: "12345678")

Administrator.create!(first_name: "Marcela",
              second_name: "Ignacia",
              first_last_name: "Coronado",
              second_last_name: "Díaz",
              mobile: "5698774412",
              landline: " ",
              email: "marcelacoronado@gmail.com",
              password: "12345678")

PropertyType.create!(description: "Bodega")
PropertyType.create!(description: "Edificio")
PropertyType.create!(description: "Departamento")
PropertyType.create!(description: "Local")
