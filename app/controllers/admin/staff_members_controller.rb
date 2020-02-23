# frozen_string_literal: true

class Admin::StaffMembersController < Admin::Base

  def index
    @staff_members = StaffMember.order(:family_name_kana, :given_name_kana)
  end

  def new
    
  end
end
