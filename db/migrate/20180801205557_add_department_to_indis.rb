class AddDepartmentToIndis < ActiveRecord::Migration[5.1]
  def change
    add_column :indis, :department, :string
  end
end
