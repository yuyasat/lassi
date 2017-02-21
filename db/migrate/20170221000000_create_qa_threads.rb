class CreateQaThreads < ActiveRecord::Migration[5.0]
  def change
    create_table :qa_threads do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.integer :carrier, null: false
      t.string :terminal, null: false
      t.string :content, null: false
      t.boolean :updated, null: false
    end
  end
end
