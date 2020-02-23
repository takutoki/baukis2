# frozen_string_literal: true

class Admin::LoginForm
  include ActiveModel::Model

  attr_accessor :email, :password
end