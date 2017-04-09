class CreateOpinions < ActiveRecord::Migration[5.0]
  def change
    create_table :opinions do |t|
      t.text   :content,      null: false
      t.string :ip,           null: false
      t.string :user_agent,   null: false

      t.timestamps
    end
  end
end
