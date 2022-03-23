ActiveAdmin.register PkmnStat do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pkmn_general_id, :total_points, :hp, :attack, :defence, :sp_attack, :sp_defence, :speed
  #
  # or
  #
  # permit_params do
  #   permitted = [:pkmn_general_id, :total_points, :hp, :attack, :defence, :sp_attack, :sp_defence, :speed]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
