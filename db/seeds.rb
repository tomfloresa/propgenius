# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Administrator.create!(first_name: 'Marcela',
                      second_name: ' ',
                      first_last_name: ' ',
                      second_last_name: ' ',
                      mobile: '90000000',
                      landline: ' ',
                      email: 'inmobiliaria.valprop@gmail.com',
                      password: 'valprop2017')

PropertyType.create!(description: 'Bodega')
PropertyType.create!(description: 'Edificio')
PropertyType.create!(description: 'Departamento')
PropertyType.create!(description: 'Local Comercial')

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
Bank.create(name: 'Banco Corpbanca')
Bank.create(name: 'Banco Scotiabank')

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
