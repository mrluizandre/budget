# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Month.create!(month: Date.today.at_beginning_of_month)
Category.create!(name: "To be budgeted", to_be_budgeted: true)
Group.create!(name: "Inflow")