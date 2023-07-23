class AddStatusToRestaurants < ActiveRecord::Migration[7.0]
  def change
    add_column :restaurants, :status, :string, default: 'open'
  end
end
