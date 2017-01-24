class CreateTryHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :try_histories do |t|
      t.references :question_set_history, null: false
      t.jsonb      :choices, null: false
      #t.references :question_set, null: false

      t.timestamps
    end
  end
end
