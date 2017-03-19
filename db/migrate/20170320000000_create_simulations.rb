class CreateSimulations < ActiveRecord::Migration[5.0]
  def change
    create_table :simulations, id: :uuid do |t|
      t.integer :carrier,  null: false
      t.integer :capacity, null: false
      t.boolean :voice,    null: false
      t.boolean :sms,      null: false
      t.integer :speed,    null: false

      t.timestamps null: false
    end
  end
end
