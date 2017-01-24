class CreateParties < ActiveRecord::Migration[5.0]
  def change
    create_table :parties do |t|
      t.string  :name,              null: false
      t.string  :official_name,     null: false
      t.integer :action,            null: false, limit: 1, default: 0
      t.date    :acted_on,          null: false
      t.date    :ended_on,          null: false, default: '9999-12-31'
      t.integer :previous_party_id, null: false, default: 0

      t.timestamps
    end
    add_index :parties, [:official_name, :acted_on], unique: true
  end
end
