class CreatePkmnGenerals < ActiveRecord::Migration[7.0]
  def change
    create_table :pkmn_generals do |t|
      t.string :pkmn_general_id
      t.string :dex_num
      t.string :name
      t.string :gen
      t.string :species
      t.integer :type_count
      t.string :type_1
      t.string :type_2
      t.string :height
      t.string :weight

      t.timestamps
    end
  end
end
