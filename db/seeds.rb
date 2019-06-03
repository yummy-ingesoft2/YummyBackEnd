# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts 'started loading data'

10.times do |row|
    clientsList = []
    productsList = []
    driversList = []
    
    ci = City.create(name: Faker::Address.city)
    
    30.times do 
        co = Cook.create(name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        state: Faker::Boolean.boolean,
        gender: Faker::Gender.type,
        birthdate: Faker::Date.backward(23_725),
        tel: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        address: Faker::Address.building_number,
        user: Faker::Internet.user_name,
        password: Faker::Internet.password(8,16),
        city_id: ci.id)
        
        5.times do
            pr = Product.create(category: Faker::Food.spice,
            name: Faker::Food.dish,
            description: Faker::Food.description,
            cost: Faker::Commerce.price(0..100.0, false),
            cook_id: co.id)
            productsList << pr.id
        end
    end
    
    80.times do 
        cl = Client.create(name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        gender: Faker::Gender.type,
        birthdate: Faker::Date.backward(23_725),
        email: Faker::Internet.email,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        address: Faker::Address.building_number,
        user: Faker::Internet.user_name,
        password: Faker::Internet.password(8,16),
        city_id: ci.id)
        clientsList << cl.id
    end
    
    50.times do
        dr = Driver.create(name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        user: Faker::Internet.user_name,
        password: Faker::Internet.password(8,16),
        email: Faker::Internet.email,
        city_id: ci.id)
        driversList << dr.id
    end
    
    120.times do |i|
        cl = clientsList.sample
        pr = productsList.sample
        dr = driversList.sample
        
        #Order.create(state: Faker::Boolean.boolean,
        #quantity: Faker::Number.number(2),
        #cost: Faker::Commerce.price(0..100.0, false),
        #order_date: Faker::Date.forward(100),
        #client_id: cl, 
        #product_id: pr,
        #driver_id: dr)
        
        if i % 2 == 0
            Review.create(qualification: Faker::Number.number(1),
            content: "",
            client_id: cl,
            product_id: pr)
        end
    end
end

puts 'finished loading data'
