class CreateUserTryHistoryRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_try_history_relationships do |t|
      t.references :user, null: false
      t.references :try_history, nul: false

      t.timestamps
    end
  end
end
