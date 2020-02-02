require 'faker'

StaffMember.create!(
  email: Faker::Internet.email,
  family_name: "山田",
  given_name: "太郎",
  family_name_kana: "ヤマダ",
  given_name_kana: "タロウ",
  password: "password",
  start_date: Time.zone.now
)