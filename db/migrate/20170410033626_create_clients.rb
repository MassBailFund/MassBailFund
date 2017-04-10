class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :email
      t.date :birth_date
      t.belongs_to :address, foreign_key: true
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
  end
end
