class RemoveBirthdayFromIndis < ActiveRecord::Migration[5.1]
  def change
    remove_column :indis, :birthday, :string
  end
end
