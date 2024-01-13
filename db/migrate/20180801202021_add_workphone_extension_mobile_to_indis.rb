class AddWorkphoneExtensionMobileToIndis < ActiveRecord::Migration[5.1]
  def change
    add_column :indis, :workphone, :string
    add_column :indis, :extension, :string
    add_column :indis, :mobilephone, :string
  end
end
