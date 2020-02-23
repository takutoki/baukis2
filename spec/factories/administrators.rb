# frozen_string_literal: true

# == Schema Information
#
# Table name: administrators
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  hashed_password :string
#  suspended       :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'faker'

FactoryBot.define do
  factory :administrator do
    email { Faker::Internet.email }
    password { "hoge" }
    suspended { false }
  end
end
