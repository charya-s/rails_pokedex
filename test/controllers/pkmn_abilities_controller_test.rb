require "test_helper"

class PkmnAbilitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pkmn_ability = pkmn_abilities(:one)
  end

  test "should get index" do
    get pkmn_abilities_url, as: :json
    assert_response :success
  end

  test "should create pkmn_ability" do
    assert_difference("PkmnAbility.count") do
      post pkmn_abilities_url, params: { pkmn_ability: { abilities_num: @pkmn_ability.abilities_num, ability_1: @pkmn_ability.ability_1, ability_2: @pkmn_ability.ability_2, ability_hidden: @pkmn_ability.ability_hidden, pkmn_id: @pkmn_ability.pkmn_id } }, as: :json
    end

    assert_response :created
  end

  test "should show pkmn_ability" do
    get pkmn_ability_url(@pkmn_ability), as: :json
    assert_response :success
  end

  test "should update pkmn_ability" do
    patch pkmn_ability_url(@pkmn_ability), params: { pkmn_ability: { abilities_num: @pkmn_ability.abilities_num, ability_1: @pkmn_ability.ability_1, ability_2: @pkmn_ability.ability_2, ability_hidden: @pkmn_ability.ability_hidden, pkmn_id: @pkmn_ability.pkmn_id } }, as: :json
    assert_response :success
  end

  test "should destroy pkmn_ability" do
    assert_difference("PkmnAbility.count", -1) do
      delete pkmn_ability_url(@pkmn_ability), as: :json
    end

    assert_response :no_content
  end
end
