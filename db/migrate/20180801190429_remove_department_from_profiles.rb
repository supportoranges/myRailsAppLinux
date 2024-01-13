class RemoveDepartmentFromProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :profiles, :department, :string
  end
end
