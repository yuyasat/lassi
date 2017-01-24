class CreateQuestionHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :question_histories do |t|
      t.references :question_set_history, null: false
      t.string :title, null: false
      t.jsonb :scores, null: false

      t.timestamps
    end
    add_index :question_histories, :scores, using: 'gin'
  end
end
