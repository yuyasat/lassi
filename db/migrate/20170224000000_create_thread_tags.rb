class CreateThreadTags < ActiveRecord::Migration[5.0]
  def change
    create_table :thread_tags do |t|
      t.references :qa_thred, null: false
      t.integer    :tag, null: false
    end
  end
end
