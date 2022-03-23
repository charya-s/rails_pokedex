class PkmnGeneralsController < ApplicationController

  # GET /pkmn_generals
  def index
    @pkmn_generals = PkmnGeneral.all
    render json: @pkmn_generals.to_json
  end

  # GET /pkmn_generals/id
  def show
    @pkmn_general = PkmnGeneral.find(params[:id])
    render json: @pkmn_general.to_json(:include => { 
        :pkmn_abilities => { 
          :only => [:pkmn_general_id, :abilities_num, :ability_1, :ability_2, :ability_hidden] 
        },
        :pkmn_stats => {
          :only => [:pkmn_general_id, :total_points, :hp, :attack, :defense, :sp_attack, :sp_defense, :speed]
        },
        :pkmn_breedings => {
          :only => [:pkmn_general_id, :growth_rate, :catch_rate, :percentage_male, :egg_type_1, :egg_type_2]
        }      
    })
  end

  # GET /search_abilities/search
  def search_abilities 
    @general_search = PkmnGeneral.joins(:pkmn_abilities).where("pkmn_abilities.ability_1 LIKE ? or pkmn_abilities.ability_2 LIKE ? or pkmn_abilities.ability_hidden LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
    render json: @general_search.to_json
  end

  # GET /goodpkmn
  def goodpkmn 
    @good_pkmn = PkmnGeneral.joins(:pkmn_stats, :pkmn_abilities).where("pkmn_stats.total_points > 499 and pkmn_abilities.abilities_num > 1")
    render json: @good_pkmn.to_json
  end


  # GET /search_abilities_good/search
  def search_abilities_good
    @good_search = PkmnGeneral.joins(:pkmn_stats, :pkmn_abilities).where("pkmn_stats.total_points > 499 and pkmn_abilities.abilities_num > 1").where("pkmn_abilities.ability_1 LIKE ? or pkmn_abilities.ability_2 LIKE ? or pkmn_abilities.ability_hidden LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%", "%" + params[:q] + "%")
    render json: @good_search.to_json
  end

  # GET /goodpkmn/search
end
