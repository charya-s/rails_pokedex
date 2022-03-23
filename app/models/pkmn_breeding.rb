class PkmnBreeding < ApplicationRecord
    belongs_to :pkmn_general, :foreign_key => 'pkmn_general_id'
end
