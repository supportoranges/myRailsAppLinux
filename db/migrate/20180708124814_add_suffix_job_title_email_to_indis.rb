class AddSuffixJobTitleEmailToIndis < ActiveRecord::Migration[5.1]
  def change
    add_column :indis, :contact_suffix, :string
    add_column :indis, :jobtitle, :string
    add_column :indis, :contact_email, :string
  end
end
