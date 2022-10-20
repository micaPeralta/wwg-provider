# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    users = User.create([
    {name: 'Luis Miguel', username: 'luismi', email:'luismiguel@gmail.com', password:'123abc'},
    {name: 'Mateo', username: 'Mat', email:'mateo@gmail.com', password:'123abc'}
    ])


    materials = Material.create([
    {name: 'Plastic', quantity: Random.new.rand(20..30)}
    {name: 'Nylon', quantity: Random.new.rand(20..30)}
    {name: 'Beryllium', quantity: Random.new.rand(20..30)}
    {name: 'Beryllium', quantity: Random.new.rand(20..30)}
    {name: 'Metal', quantity: Random.new.rand(20..30)}
    {name: 'nut', quantity: Random.new.rand(20..30)}
    ])