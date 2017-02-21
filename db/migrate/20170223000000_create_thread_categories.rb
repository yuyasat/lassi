class CreateThreadCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_categories do |t|
      t.references :qa_thred, null: false
      t.integer    :category, null: false
    end
  end
end
