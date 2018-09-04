User.create!(name:  "Ahmed Mohamed Fouad",
             phone: "1273737878",
             role: 'Driver',
             password:              "12345678",
             password_confirmation: "12345678"
             )

User.create!(name:  "Ahmed Kareem",
             phone: "1200000000",
             role: 'Passenger',
             password:              "12345678",
             password_confirmation: "12345678"
             )

Place.create!(name: "ElDokky", longitude: "10", latitude: "20")
Place.create!(name: "ElMaadi", longitude: "20", latitude: "7")
Place.create!(name: "Helwan", longitude: "15", latitude: "12")

AdminUser.create!(email: 'admin@raye7.com', password: 'password', password_confirmation: 'password')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?