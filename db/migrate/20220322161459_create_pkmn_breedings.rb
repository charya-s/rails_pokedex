class CreatePkmnBreedings < ActiveRecord::Migration[7.0]
  def change
    create_table :pkmn_breedings do |t|
      t.integer :pkmn_general_id
      t.string :growth_rate
      t.integer :catch_rate
      t.float :percentage_male
      t.string :egg_type_1
      t.string :egg_type_2

      t.timestamps
    end
  end
end
