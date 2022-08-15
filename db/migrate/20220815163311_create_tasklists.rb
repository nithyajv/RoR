class CreateTasklists < ActiveRecord::Migration[7.0]
  def change
    create_table :tasklists do |t|
      t.string :Taskname
      t.boolean :Status
      t.date :Duedate
      t.text :Details

      t.timestamps
    end
  end
end
