class CreateQuestionSetHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :question_set_histories do |t|
      t.references :question_set, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
