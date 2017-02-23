class CreateThreadLabels < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_labels do |t|
      t.references :qa_thred, null: false
      t.integer    :label, null: false

      t.timestamps null: false
    end
  end
end
