class CreateQuestionSets < ActiveRecord::Migration[5.0]
  def change
    create_table :question_sets do |t|
      t.references :user,   null: false
      t.string     :title,  null: false
      t.integer    :status, null: false, limit: 1, default: 0

      t.timestamps
    end
    add_foreign_key :question_sets, :users
  end
end
