import React, { useState, useEffect } from 'react';

function Info_Popup(props) {

    const pkmn_id = props.pkmn_id;

    // Default data.
    const [pkmn_data, setPkmnData] = useState({
        'dex_num': 0,
        'name': '',
        'gen': 0,
        'type_1': '',
        'type_2': '',
        'pkmn_abilities': [{
            'ability_1': '',
            'ability_2': '',
        }],
        'pkmn_stats': [{
            'hp': 0,
            'attack': 0,
            'defence': 0,
            'sp_attack': 0,
            'sp_defence': 0,
            'speed': 0,
        }],
        'pkmn_breedings': [{
            'catch_rate': 0,
            'growth_rate': 0,
            'egg_type_1': '',
            'egg_type_2': '',
            'percentage_male': 0
        }]
    });

    useEffect(() => {
        fetch('/pkmn_generals/' + pkmn_id)
        .then(response => response.json())
        .then(json => setPkmnData(json))
        .catch(error => console.log(error))
    }, []);


    // Prepare data.
    var dex_num = "";
    if (pkmn_data != null) {
        dex_num = pkmn_data['dex_num'] + "";
        while (dex_num.length < 3) 
            dex_num = "0" + dex_num;
    }


    return (
        <div className='popup-cont'>
            <div className='inner-cont'>
                <div className='basic-info-cont'>
                    <p><span className='stat-title'>Gen {pkmn_data['gen']}</span></p>
                    <p>{dex_num}</p>
                    <img src={"https://www.serebii.net/swordshield/pokemon/" + dex_num + ".png"} alt={dex_num + "_image"} width={150} height={150}/>
                    <p><span className='stat-title'>{pkmn_data['name']}</span></p>
                    <p><img alt="type_1" src={"https://play.pokemonshowdown.com/sprites/types/" + pkmn_data['type_1'] + ".png"}/>{pkmn_data['type_2'] != null ? <img alt="type_2" src={"https://play.pokemonshowdown.com/sprites/types/" + pkmn_data['type_2'] + ".png"} /> : ''}</p>
                    <p>{pkmn_data['pkmn_abilities'][0]['ability_1']}{pkmn_data['pkmn_abilities'][0]['ability_2'] != null ? '/' + pkmn_data['pkmn_abilities'][0]['ability_2'] : ''}{pkmn_data['pkmn_abilities'][0]['ability_hidden'] != null ? ' (' + pkmn_data['pkmn_abilities'][0]['ability_hidden'] + ')' : ""}</p>
                </div>
                <div className='right-cont'>
                    <div className='stats-cont'>
                        <p><span className='stat-title'>HP:</span> {pkmn_data['pkmn_stats'][0]['hp']}</p>
                        <p><span className='stat-title'>Atk.:</span> {pkmn_data['pkmn_stats'][0]['attack']}</p>
                        <p><span className='stat-title'>Def.:</span> {pkmn_data['pkmn_stats'][0]['defense']}</p>
                        <p><span className='stat-title'>Sp. Atk.:</span> {pkmn_data['pkmn_stats'][0]['sp_attack']}</p>
                        <p><span className='stat-title'>Sp. Def.:</span> {pkmn_data['pkmn_stats'][0]['sp_defense']}</p>
                        <p><span className='stat-title'>Speed:</span> {pkmn_data['pkmn_stats'][0]['speed']}</p>
                    </div>
                    <div className='breeding-cont'>
                        <p><span className='stat-title'>Egg Group:</span> {pkmn_data['pkmn_breedings'][0]['egg_type_1']}{pkmn_data['pkmn_breedings'][0]['egg_type_2'] != null ? '/' + pkmn_data['pkmn_breedings'][0]['egg_type_2'] : ''}</p>
                        <p><span className='stat-title'>Growth Rate:</span> {pkmn_data['pkmn_breedings'][0]['growth_rate']}</p>
                        <p><span className='stat-title'>Catch Rate:</span> {pkmn_data['pkmn_breedings'][0]['catch_rate']/3}%</p>
                        <p><span className='stat-title'>Chance of male:</span> {pkmn_data['pkmn_breedings'][0]['percentage_male']}%</p>
                    </div>
                </div>
            </div>
        </div>
    )
}

export default Info_Popup;