class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :amount, default: 0, null: false

      t.timestamps
    end
  end
end