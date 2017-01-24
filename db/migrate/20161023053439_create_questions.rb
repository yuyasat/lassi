class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :user, null: false
      t.string :title,    null: false

      t.timestamps
    end
    add_foreign_key :questions, :users
  end
end
