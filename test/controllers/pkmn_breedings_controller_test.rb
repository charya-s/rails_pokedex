require "test_helper"

class PkmnBreedingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pkmn_breeding = pkmn_breedings(:one)
  end

  test "should get index" do
    get pkmn_breedings_url, as: :json
    assert_response :success
  end

  test "should create pkmn_breeding" do
    assert_difference("PkmnBreeding.count") do
      post pkmn_breedings_url, params: { pkmn_breeding: { catch_rate: @pkmn_breeding.catch_rate, egg_type_1: @pkmn_breeding.egg_type_1, egg_type_2: @pkmn_breeding.egg_type_2, growth_rate: @pkmn_breeding.growth_rate, percentage_male: @pkmn_breeding.percentage_male, pkmn_general_id: @pkmn_breeding.pkmn_general_id } }, as: :json
    end

    assert_response :created
  end

  test "should show pkmn_breeding" do
    get pkmn_breeding_url(@pkmn_breeding), as: :json
    assert_response :success
  end

  test "should update pkmn_breeding" do
    patch pkmn_breeding_url(@pkmn_breeding), params: { pkmn_breeding: { catch_rate: @pkmn_breeding.catch_rate, egg_type_1: @pkmn_breeding.egg_type_1, egg_type_2: @pkmn_breeding.egg_type_2, growth_rate: @pkmn_breeding.growth_rate, percentage_male: @pkmn_breeding.percentage_male, pkmn_general_id: @pkmn_breeding.pkmn_general_id } }, as: :json
    assert_response :success
  end

  test "should destroy pkmn_breeding" do
    assert_difference("PkmnBreeding.count", -1) do
      delete pkmn_breeding_url(@pkmn_breeding), as: :json
    end

    assert_response :no_content
  end
end
