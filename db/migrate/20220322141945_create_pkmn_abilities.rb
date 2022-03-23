class CreatePkmnAbilities < ActiveRecord::Migration[7.0]
  def change
    create_table :pkmn_abilities do |t|
      t.references :pkmn, null: false, foreign_key: true
      t.integer :abilities_num
      t.string :ability_1
      t.string :ability_2
      t.string :ability_hidden

      t.timestamps
    end
  end
end
