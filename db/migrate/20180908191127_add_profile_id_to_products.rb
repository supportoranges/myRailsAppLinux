class AddProfileIdToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :profile_id, :integer
  end
end
