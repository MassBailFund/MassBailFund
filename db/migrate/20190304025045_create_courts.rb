class CreateCourts < ActiveRecord::Migration[5.2]
  def change
    create_table :courts do |t|
      t.string :name

      t.timestamps
    end
    add_index :courts, :name
  end
end
