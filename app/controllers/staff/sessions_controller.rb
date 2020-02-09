# frozen_string_literal: true

class Staff::SessionsController < Staff::Base

  def new
    if current_staff_member
      redirect_to :staff_root
    else
      @form = Staff::LoginForm.new
      render action: :new
    end
  end

  def create

  end

  def destroy

  end
end
