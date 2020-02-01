# == Schema Information
#
# Table name: staff_members
#
#  id               :bigint           not null, primary key
#  email            :string           not null
#  family_name      :string           not null
#  given_name       :string           not null
#  family_name_kana :string           not null
#  given_name_kana  :string           not null
#  hashed_password  :string
#  start_date       :date             not null
#  end_date         :date
#  suspended        :boolean          default(FALSE), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe StaffMember, type: :model do

  describe "#password=" do
    context "passwordに文字列を与える" do
      it "hashed_passwordは長さ60の文字列になる" do
        member = StaffMember.new
        member.password = "baukis2"
        expect(member.hashed_password).to be_kind_of(String)
        expect(member.hashed_password.size).to eq 60
      end
    end

    context "passwordにnilを与える" do
      it "hashed_passwordはnilになる" do
        member = StaffMember.new(hashed_password: "x")
        member.password = nil
        expect(member.hashed_password).to be_nil
      end
    end
  end
end
