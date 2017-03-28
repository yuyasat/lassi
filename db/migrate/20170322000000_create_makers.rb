class CreateMakers < ActiveRecord::Migration[5.0]
  def change
    create_table :makers do |t|
      t.string :name,         null: false
    end
  end
end
