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

class Administrator < ApplicationRecord

  def password=(raw_password)
    if raw_password.kind_of?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif
      self.hashed_password = nil
    end
  end
end
