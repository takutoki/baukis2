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

require 'rails_helper'

RSpec.describe Administrator, type: :model do

  describe 'password=' do
    context 'パスワードに文字列を与える' do
      it 'hashed_passwordにハッシュ化された文字列がセットされる' do
        admin = Administrator.new
        admin.password = "foobar"
        expect(admin.hashed_password).to be_kind_of(String)
        expect(admin.hashed_password.size).to eq 60
      end
    end

    context 'パスワードにnilを与える' do
      it 'hashed_passwordにnilがセットされる' do
        admin = Administrator.new
        admin.password = nil
        expect(admin.hashed_password).to be_nil
      end
    end
  end
end
