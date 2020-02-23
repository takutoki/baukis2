require 'rails_helper'

RSpec.describe 'Admin::Authenticator' do
  let(:admin) { build(:administrator) }

  context '正しいパスワードを与える' do
    it 'trueが返る' do
      expect(Admin::Authenticator.new(admin).authenticate("hoge")).to be_truthy
    end
  end

  context '異なるパスワードを与える' do
    it 'trueが返る' do
      expect(Admin::Authenticator.new(admin).authenticate("fooooooo")).to be_falsey
    end
  end

  context 'パスワードを未設定にする' do
    let(:admin) { build(:administrator, password: nil ) }
    it 'falseが返る' do
      expect(Admin::Authenticator.new(admin).authenticate("hoge")).to be_falsey
    end
  end
end