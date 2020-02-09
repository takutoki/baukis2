require 'rails_helper'

describe 'Staff::Authenticator' do
  let(:staff_member) { build(:staff_member) }
  context '正しいパスワードを与える' do
    it 'trueが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate("pw")).to be_truthy
    end
  end

  context '異なるパスワードを与える' do
    it 'falseが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate("re")).to be_falsey
    end
  end

  context 'パスワードを未設定にする' do
    let(:staff_member) { build(:staff_member, password: nil) }
    it 'falseが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate(nil)).to be_falsey
    end
  end

  context '停止フラグがtrueのユーザー' do
    let(:staff_member) { build(:staff_member, suspended: true) }
    it 'falseが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate("pw")).to be_falsey
    end
  end

  context '開始前のユーザー' do
    let(:staff_member) { build(:staff_member, start_date: Date.tomorrow) }
    it 'falseが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate("pw")).to be_falsey
    end
  end

  context '終了日を超えたユーザー' do
    let(:staff_member) { build(:staff_member, end_date: Date.yesterday) }
    it 'falseが返る' do
      expect(Staff::Authenticator.new(staff_member).authenticate("pw")).to be_falsey
    end
  end
end