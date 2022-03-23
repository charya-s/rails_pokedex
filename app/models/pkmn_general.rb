class PkmnGeneral < ApplicationRecord
    has_many :pkmn_abilities
    has_many :pkmn_stats
    has_many :pkmn_breedings
end
