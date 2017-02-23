class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :key,              null: false
      t.references :provider,     null: false
      t.string :name,             null: false
      t.integer :data_num,        null: false, default: 0
      t.integer :sms_num,         null: false, default: 0
      t.integer :voice_num,       null: false, default: 0
      t.integer :price,           null: false
      t.string :down_speed,       null: false, default: ""
      t.string :up_speed,         null: false, default: ""
      t.string :voice_price,      null: false, default: ""
      t.string :sms_domestic
      t.string :sms_international
      t.boolean :carry_over,      null: false, default: false
      t.string :carry_over_text
      t.string :admin_fee_name
      t.string :admin_fee
      t.string :add_sim

      t.timestamps null: false
    end
  end
end
