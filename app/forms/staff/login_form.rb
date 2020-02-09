# frozen_string_literal: true

class Staff::LoginForm
  include ActiveModel::Model

  attr_accessor :email, :password
end