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

Owner.create!(first_name: "Tomás ",
              second_name: "Andrés",
              first_last_name: "Flores",
              second_last_name: "Alvear",
              mobile: "56985009287",
              landline: " ",
              email: "marcela@valprop.com",
              password: "12345678")

Administrator.create!(first_name: "Marcela",
              second_name: "Ignacia",
              first_last_name: "Coronado",
              second_last_name: "Díaz",
              mobile: "5698774412",
              landline: " ",
              email: "marcela@valprop.com",
              password: "12345678")

PropertyType.create!(description: "Bodega")
PropertyType.create!(description: "Edificio")
PropertyType.create!(description: "Departamento")
PropertyType.create!(description: "Local")

Property.create(address: "Santa Rosa 2",
                square_meters: 678,
                property_type_id: 4,
                owner_id: 1,
                renter_id: 1,
                rent_value: 5300000,
                number: 2,
                subunits_number: 0,
                comune_id: 1,
                lease_startdate: Date.today
                )

Property.create(address: "Povidencia 123",
                square_meters: 180,
                property_type_id: 2,
                renter_id: 1,
                rent_value: 450200,
                number: 606,
                subunits_number: 20,
                comune_id: 1,
                lease_startdate: Date.today
                )

Property.create(address: "Gran Avenida 992",
                square_meters: 780,
                property_type_id: 2,
                renter_id: 1,
                rent_value: 20500300,
                number: 606,
                subunits_number: 40,
                comune_id: 2,
                lease_startdate: Date.today
                )

Property.create(address: "Lord Cochrane 173",
                square_meters: 234,
                property_type_id: 3,
                renter_id: 1,
                rent_value: 450200,
                number: 606,
                subunits_number: 0,
                comune_id: 1,
                lease_startdate: Date.today
                )
Bank.create(name: "Banco de Chile")
Bank.create(name: "Banco Santander")
Bank.create(name: "Banco de Crédito e Inversiones")
Bank.create(name: "Banco Santander Banefe")
Bank.create(name: "Scotiabank")
