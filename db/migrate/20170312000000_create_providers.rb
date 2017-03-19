class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :key,  null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
