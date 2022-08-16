class AddUserToTasklist < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasklists, :user, null: false, foreign_key: true
  end
end
