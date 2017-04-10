class CreateThirdParties < ActiveRecord::Migration[5.0]
  def change
    create_table :third_parties do |t|
      t.string :relationship_to_client
      t.belongs_to :address, foreign_key: true
      t.belongs_to :contact, foreign_key: true

      t.timestamps
    end
  end
end
