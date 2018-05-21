class AddRaceToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :CLIENT_RACE, :string
  end
end
