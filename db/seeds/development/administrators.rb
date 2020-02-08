require 'faker'

Administrator.create!(
  email: Faker::Internet.email,
  password: "foobar"
)
