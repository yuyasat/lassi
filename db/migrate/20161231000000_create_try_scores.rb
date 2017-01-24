class CreateTryScores < ActiveRecord::Migration[5.0]
  def change
    create_table :try_scores do |t|
      t.references :try_history, null: false
      t.references :party, null: false
      t.integer    :total, null: false, default: 0
      t.integer    :percentage, null: false, default: 0

      t.timestamps
    end
  end
end
