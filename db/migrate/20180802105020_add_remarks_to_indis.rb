class AddRemarksToIndis < ActiveRecord::Migration[5.1]
  def change
    add_column :indis, :remarks, :text
  end
end
