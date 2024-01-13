class CreateIndis < ActiveRecord::Migration[5.1]
  def change
    create_table :indis do |t|
      t.string :greet
      t.string :firstname
      t.string :middle
      t.string :lastname
      t.string :birthday
      t.string :phone

      t.timestamps
    end
  end
end
