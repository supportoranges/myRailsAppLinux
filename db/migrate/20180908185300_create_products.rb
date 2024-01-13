class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :internal_code
      t.string :detail
      t.string :pic

      t.timestamps
    end
  end
end
