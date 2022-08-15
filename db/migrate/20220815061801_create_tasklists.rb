class CreateTasklists < ActiveRecord::Migration[7.0]
  def change
    create_table :tasklists do |t|
      t.string :Task_name
      t.text :Details
      t.date :Due_date

      t.timestamps
    end
  end
end
