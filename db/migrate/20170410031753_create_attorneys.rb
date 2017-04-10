class CreateAttorneys < ActiveRecord::Migration[5.0]
  def change
    create_table :attorneys do |t|
      t.string :email
      t.belongs_to :address, foreign_key: true
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end

    add_index :attorneys, [:email], unique: true
  end
end
