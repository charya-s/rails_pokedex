ActiveAdmin.register PkmnBreeding do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pkmn_general_id, :growth_rate, :catch_rate, :percentage_male, :egg_type_1, :egg_type_2
  #
  # or
  #
  # permit_params do
  #   permitted = [:pkmn_general_id, :growth_rate, :catch_rate, :percentage_male, :egg_type_1, :egg_type_2]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
