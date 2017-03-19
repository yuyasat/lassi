class CreateTerminals < ActiveRecord::Migration[5.0]
  def change
    create_table :terminals do |t|
      t.string :name,         null: false
      t.references :maker,    null: false
      t.integer :carrier,     null: false
      t.boolean :band1,       null: false, default: false
      t.boolean :band3,       null: false, default: false
      t.boolean :band8,       null: false, default: false
      t.boolean :band11,      null: false, default: false
      t.boolean :band18_26,   null: false, default: false
      t.boolean :band19,      null: false, default: false
      t.boolean :band21,      null: false, default: false
      t.boolean :band28,      null: false, default: false
      t.boolean :wc_band1,    null: false, default: false
      t.boolean :wc_band6_19, null: false, default: false
      t.boolean :wc_band8,    null: false, default: false
      t.boolean :wc_band9,    null: false, default: false
      t.boolean :wc_band11,   null: false, default: false
    end
  end
end
