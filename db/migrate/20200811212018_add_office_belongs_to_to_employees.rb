class AddOfficeBelongsToToEmployees < ActiveRecord::Migration[5.1]
  def change
    add_reference :employees, :office, foreign_key: true
  end
end
