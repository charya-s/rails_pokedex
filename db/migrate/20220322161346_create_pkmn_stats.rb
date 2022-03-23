class CreatePkmnStats < ActiveRecord::Migration[7.0]
  def change
    create_table :pkmn_stats do |t|
      t.integer :pkmn_general_id
      t.integer :total_points
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed

      t.timestamps
    end
  end
end
