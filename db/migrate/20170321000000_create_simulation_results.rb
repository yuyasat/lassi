class CreateSimulationResults < ActiveRecord::Migration[5.0]
  def change
    create_table :simulation_results do |t|
      t.uuid       :simulation_id, null: false
      t.references :plan,          null: false

      t.timestamps null: false
    end
  end
end
