ActiveAdmin.register PkmnAbility do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :pkmn_id, :abilities_num, :ability_1, :ability_2, :ability_hidden
  #
  # or
  #
  # permit_params do
  #   permitted = [:pkmn_id, :abilities_num, :ability_1, :ability_2, :ability_hidden]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
