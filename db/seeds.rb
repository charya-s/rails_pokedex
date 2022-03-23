# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.create!(email: 'admin@pkmn', password: 'password', password_confirmation: 'password') unless AdminUser.find_by(email: 'admin@pkmn')

# GENERAL TABLE #
generals_csv_text = File.read(Rails.root.join('lib', 'seeds', 'pkmn_general.csv'))
generals_csv = CSV.parse(generals_csv_text, :headers => true, :encoding => 'ISO-8859-1')

abilities_csv_text = File.read(Rails.root.join('lib', 'seeds', 'pkmn_abilities.csv'))
abilities_csv = CSV.parse(abilities_csv_text, :headers => true, :encoding => 'ISO-8859-1')

stats_csv_text = File.read(Rails.root.join('lib', 'seeds', 'pkmn_stats.csv'))
stats_csv = CSV.parse(stats_csv_text, :headers => true, :encoding => 'ISO-8859-1')

breeding_csv_text = File.read(Rails.root.join('lib', 'seeds', 'pkmn_breeding.csv'))
breeding_csv = CSV.parse(breeding_csv_text, :headers => true, :encoding => 'ISO-8859-1')

pkmn_count = 0

generals_csv.each do |row|
    curr_pkmn = PkmnGeneral.create(
        pkmn_general_id: pkmn_count,
        dex_num: row['dex_num'],
        name: row['name'],
        gen: row['gen'],
        species: row['species'][0...-11],
        type_count: row['type_count'],
        type_1: row['type_1'],
        type_2: row['type_2'],
        height: row['height'],
        weight: row['weight'],
    )

    curr_abilities = abilities_csv[pkmn_count]
    curr_pkmn.pkmn_abilities.create(
        pkmn_general_id: pkmn_count,
        abilities_num: curr_abilities['abilities_num'],
        ability_1: curr_abilities['ability_1'],
        ability_2: curr_abilities['ability_2'],
        ability_hidden: curr_abilities['ability_hidden']
    )

    curr_stats = stats_csv[pkmn_count]
    curr_pkmn.pkmn_stats.create(
        pkmn_general_id: pkmn_count,
        total_points: curr_stats['total_points'],
        hp: curr_stats['hp'],
        attack: curr_stats['attack'],
        defense: curr_stats['defense'],
        sp_attack: curr_stats['sp_attack'],
        sp_defense: curr_stats['sp_defense'],
        speed: curr_stats['speed']
    )

    curr_breeding = breeding_csv[pkmn_count]
    curr_pkmn.pkmn_breedings.create(
        pkmn_general_id: pkmn_count,
        growth_rate: curr_breeding['growth_rate'],
        catch_rate: curr_breeding['catch_rate'],
        percentage_male: curr_breeding['percentage_male'],
        egg_type_1: curr_breeding['egg_type_1'],
        egg_type_2: curr_breeding['egg_type_2']
    )

    puts "Added #{pkmn_count} to the database!"
    pkmn_count = pkmn_count + 1
end


