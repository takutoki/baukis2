class AddIndexLowerEmailToStaffMembersAndAdministrators < ActiveRecord::Migration[6.0]
  
  def up
    add_index :staff_members, "LOWER(email)", unique: true
    add_index :administrators, "LOWER(email)", unique: true
  end

  def down
    remove_index :staff_members, name: :index_staff_members_on_LOWER_email
    remove_index :administrators, name: :index_administrators_on_LOWER_email
  end
end
