class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :key,              null: false
      t.integer :parent_id,    null: false
      t.references :provider,     null: false
      t.string :name,             null: false
      t.integer :carrier,         null: false
      t.integer :data_num,        null: false, default: 0
      t.integer :sms_num,         null: false, default: 0
      t.integer :voice_num,       null: false, default: 0
      t.integer :capacity,        null: true
      t.integer :price,           null: false
      t.string :down_speed,       null: true
      t.string :up_speed,         null: true
      t.string :voice_price,      null: true
      t.string :sms_domestic
      t.string :sms_international
      t.string :carry_over,       null: true
      t.string :admin_fee_name
      t.string :admin_fee
      t.string :add_sim
      t.boolean :visible,         null: false, default: false

      t.timestamps null: false
    end
  end
end
