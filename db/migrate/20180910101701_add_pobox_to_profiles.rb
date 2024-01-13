class AddPoboxToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :pobox, :string
  end
end
