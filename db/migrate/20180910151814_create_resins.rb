class CreateResins < ActiveRecord::Migration[5.2]
  def change
    create_table :resins do |t|
      t.string :product_code

      t.timestamps
    end
  end
end
