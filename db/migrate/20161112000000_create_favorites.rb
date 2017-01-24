class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :question_set, null: false
      t.timestamps
    end
    add_index :favorites, [:user_id, :question_set_id], unique: true
  end
end
