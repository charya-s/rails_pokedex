ActiveAdmin.register PkmnGeneral do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pkmn_id, :dex_num, :name, :gen, :species, :type_count, :type_1, :type_2, :height, :weight
  #
  # or
  #
  # permit_params do
  #   permitted = [:pkmn_id, :dex_num, :name, :gen, :species, :type_count, :type_1, :type_2, :height, :weight]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
