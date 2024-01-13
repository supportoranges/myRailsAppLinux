class RemovePhoneFromIndis < ActiveRecord::Migration[5.1]
  def change
    remove_column :indis, :phone, :string
  end
end
