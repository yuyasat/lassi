class CreateQuestionSetRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :question_set_relationships do |t|
      t.references :question_set
      t.references :question

      t.timestamps
    end
    add_index :question_set_relationships, [:question_set_id, :question_id],
              unique: true, name: 'question_set_index'
  end
end
