# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Renter.create!(first_name: 'Juan',
               second_name: 'Andrés',
               first_last_name: 'Silva',
               second_last_name: 'Gallardo',
               mobile: '56987716320',
               landline: ' ',
               email: 'juansilva@gmail.com',
               password: '12345678')

Owner.create!(first_name: 'Tomás ',
              second_name: 'Andrés',
              first_last_name: 'Flores',
              second_last_name: 'Alvear',
              mobile: '56985009287',
              landline: ' ',
              email: 'marcela@valprop.com',
              password: '12345678')

Administrator.create!(first_name: 'Marcela',
                      second_name: 'Ignacia',
                      first_last_name: 'Coronado',
                      second_last_name: 'Díaz',
                      mobile: '5698774412',
                      landline: ' ',
                      email: 'marcela@valprop.com',
                      password: '12345678')

PropertyType.create!(description: 'Bodega')
PropertyType.create!(description: 'Edificio')
PropertyType.create!(description: 'Departamento')
PropertyType.create!(description: 'Local')

Property.create(address: 'Santa Rosa 2',
                square_meters: 678,
                property_type_id: 4,
                owner_id: 1,
                renter_id: 1,
                rent_value: 5_300_000,
                subunits_number: 0,
                comune_id: 1,
                lease_startdate: Date.today,
                bank_id: 1)

Property.create(address: 'Povidencia 123',
                square_meters: 180,
                property_type_id: 2,
                renter_id: 1,
                owner_id: 1,
                rent_value: 450_200,
                subunits_number: 20,
                comune_id: 1,
                lease_startdate: Date.today,
                bank_id: 1)

Property.create(address: 'Gran Avenida 992',
                square_meters: 780,
                property_type_id: 2,
                renter_id: 1,
                owner_id: 1,
                rent_value: 20_500_300,
                subunits_number: 40,
                comune_id: 2,
                lease_startdate: Date.today,
                bank_id: 1)

Property.create(address: 'Lord Cochrane 173',
                square_meters: 234,
                property_type_id: 3,
                renter_id: 1,
                owner_id: 1,
                rent_value: 450_200,
                subunits_number: 0,
                comune_id: 1,
                lease_startdate: Date.today,
                bank_id: 1)

Bank.create(name: 'Banco de Chile')
Bank.create(name: 'Banco Santander')
Bank.create(name: 'Banco de Crédito e Inversiones')
Bank.create(name: 'Banco Scotiabank')
Bank.create(name: 'Banco Estado')
Bank.create(name: 'Banco Internaional')
Bank.create(name: 'Banco BBVA')
Bank.create(name: 'Banco Itaú')
Bank.create(name: 'Banco Falabella')
Bank.create(name: 'Banco Condell')

BankAccountType.create(name: 'Cuenta Corriente')
BankAccountType.create(name: 'Cuenta Vista')
BankAccountType.create(name: 'Cuenta de Ahorro')
BankAccountType.create(name: 'Cuenta RUT')

ImportantNumericalValue.create(name: 'UF', value: '26981')
ImportantNumericalValue.create(name: 'IVA', value: '19')

PaymentMethod.create(name: 'Efectivo')
PaymentMethod.create(name: 'Transferencia Electrónica')
PaymentMethod.create(name: 'Cheque')
PaymentMethod.create(name: 'Vale Vista')
PaymentMethod.create(name: 'Depósito Bancario')
PaymentMethod.create(name: 'Otros')

Comune.create(name: 'Santiago')
Comune.create(name: 'Providencia')
Comune.create(name: 'San Miguel')
Comune.create(name: 'Estación Central')
Comune.create(name: 'Las Condes')
Comune.create(name: 'Vitacura')
Comune.create(name: 'La Florida')
Comune.create(name: 'Quinta Normal')
Comune.create(name: 'Pudahuel')
Comune.create(name: 'Maipú')
Comune.create(name: 'La Granja')
Comune.create(name: 'Puente Alto')
Comune.create(name: 'Pedro Aguirre Cerda')
Comune.create(name: 'Cerrillos')
Comune.create(name: 'Cerro Navia')
Comune.create(name: 'Conchalí')
Comune.create(name: 'El Bosque')
Comune.create(name: 'Huechuraba')
Comune.create(name: 'Independencia')
Comune.create(name: 'La Pintana')
Comune.create(name: 'Peñalolén')
Comune.create(name: 'San Joaquín')
Comune.create(name: 'San Ramón')
Comune.create(name: 'San Bernardo')
Comune.create(name: 'Renca')
Comune.create(name: 'Recoleta')
