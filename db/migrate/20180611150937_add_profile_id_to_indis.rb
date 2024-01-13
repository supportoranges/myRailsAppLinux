class AddProfileIdToIndis < ActiveRecord::Migration[5.1]
  def change
    add_column :indis, :profile_id, :integer
  end
end
