require 'faker'
namespace :db do
  desc "Fill database with sample users"
  task create_users: :environment do
    User.destroy_all
    admin = User.create!(name: "Example admin",
                         email: "example@admin.com",
                         password: "password",
                         password_confirmation: "password",
                         about: 'text about admin',
                         admin: true)
    30.times do |n|
      name  = Faker::Name.name
      about = Faker::Lorem.paragraph
      email = "sample-#{n+1}@user.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   about: about,
                   password: password,
                   password_confirmation: password)
    end
  end
end
