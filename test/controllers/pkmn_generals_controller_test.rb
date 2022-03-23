require "test_helper"

class PkmnGeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pkmn_general = pkmn_generals(:one)
  end

  test "should get index" do
    get pkmn_generals_url, as: :json
    assert_response :success
  end

  test "should create pkmn_general" do
    assert_difference("PkmnGeneral.count") do
      post pkmn_generals_url, params: { pkmn_general: { dex_num: @pkmn_general.dex_num, gen: @pkmn_general.gen, height: @pkmn_general.height, name: @pkmn_general.name, pkmn_id: @pkmn_general.pkmn_id, species: @pkmn_general.species, type_1: @pkmn_general.type_1, type_2: @pkmn_general.type_2, type_count: @pkmn_general.type_count, weight: @pkmn_general.weight } }, as: :json
    end

    assert_response :created
  end

  test "should show pkmn_general" do
    get pkmn_general_url(@pkmn_general), as: :json
    assert_response :success
  end

  test "should update pkmn_general" do
    patch pkmn_general_url(@pkmn_general), params: { pkmn_general: { dex_num: @pkmn_general.dex_num, gen: @pkmn_general.gen, height: @pkmn_general.height, name: @pkmn_general.name, pkmn_id: @pkmn_general.pkmn_id, species: @pkmn_general.species, type_1: @pkmn_general.type_1, type_2: @pkmn_general.type_2, type_count: @pkmn_general.type_count, weight: @pkmn_general.weight } }, as: :json
    assert_response :success
  end

  test "should destroy pkmn_general" do
    assert_difference("PkmnGeneral.count", -1) do
      delete pkmn_general_url(@pkmn_general), as: :json
    end

    assert_response :no_content
  end
end
