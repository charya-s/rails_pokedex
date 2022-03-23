require "test_helper"

class PkmnStatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pkmn_stat = pkmn_stats(:one)
  end

  test "should get index" do
    get pkmn_stats_url, as: :json
    assert_response :success
  end

  test "should create pkmn_stat" do
    assert_difference("PkmnStat.count") do
      post pkmn_stats_url, params: { pkmn_stat: { attack: @pkmn_stat.attack, defence: @pkmn_stat.defence, hp: @pkmn_stat.hp, pkmn_general_id: @pkmn_stat.pkmn_general_id, sp_attack: @pkmn_stat.sp_attack, sp_defence: @pkmn_stat.sp_defence, speed: @pkmn_stat.speed, total_points: @pkmn_stat.total_points } }, as: :json
    end

    assert_response :created
  end

  test "should show pkmn_stat" do
    get pkmn_stat_url(@pkmn_stat), as: :json
    assert_response :success
  end

  test "should update pkmn_stat" do
    patch pkmn_stat_url(@pkmn_stat), params: { pkmn_stat: { attack: @pkmn_stat.attack, defence: @pkmn_stat.defence, hp: @pkmn_stat.hp, pkmn_general_id: @pkmn_stat.pkmn_general_id, sp_attack: @pkmn_stat.sp_attack, sp_defence: @pkmn_stat.sp_defence, speed: @pkmn_stat.speed, total_points: @pkmn_stat.total_points } }, as: :json
    assert_response :success
  end

  test "should destroy pkmn_stat" do
    assert_difference("PkmnStat.count", -1) do
      delete pkmn_stat_url(@pkmn_stat), as: :json
    end

    assert_response :no_content
  end
end
