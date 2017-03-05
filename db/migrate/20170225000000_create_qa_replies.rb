class CreateQaReplies < ActiveRecord::Migration[5.0]
  def change
    create_table :qa_replies do |t|
      t.references :user, null: false
      t.references :qa_thread, null: false
      t.references :qa_reply, null: false, default: 0
      t.string :content, null: false
      t.boolean :updated, null: false, default: false

      t.timestamps null: false
    end
  end
end
