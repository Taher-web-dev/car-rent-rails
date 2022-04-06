# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Car.create(brand: 'Kia', model: 'Kia Seltos', model_year: 2021,
           photo_url: 'https://media.zigcdn.com/media/model/2021/May/seltos-3_360x240.jpg',
           description: 'Seltos with three powertrains: a 115PS/144Nm 1.5-litre petrol, 140PS/242Nm 1.4-litre turbo-petrol, and a 115PS/250Nm 1.5-litre diesel unit. Seltos price starts from 150$ a day and can be reduced for a long period reservation.',
           rent_fee: 150)
Car.create(brand: 'Tesla', model: 'S', model_year: 2021,
           photo_url: 'https://www.enterprise.com/content/dam/ecom/utilitarian/common/exotics/us-refresh/car-thumbnails/thumbnail-2019-tesla-model-s-2048x1360.png',
           description: "Tesla's Model S sedan was the first mass-market car to prove that electric vehicles could be fun-to-drive, eco-friendly, viable as everyday transportation, and even useable for long trips.",
           rent_fee: 200)
