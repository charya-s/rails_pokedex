import React, { useState, useEffect } from 'react';

import Table from './modules/Table.js';

import logo from './pkmn_logo.png';
import './App.css';



function App() {

  const [pkmn_generals, setPkmnGenerals] = useState(["Loading data...", "Still loading..."]);

  const [good_check, setGoodCheck] = useState(false)
  const [search_text, setSearchText] = useState("")

  useEffect(() => {
    fetch(search_text != "" ? (good_check ? '/search_abilities_good?q=' + search_text : '/search_abilities?q=' + search_text) : (good_check ? '/goodpkmn' : '/pkmn_generals'))
    .then(response => response.json())
    .then(json => setPkmnGenerals(json))
    .catch(error => console.log(error))
  }, [good_check, search_text]);

  const columns = React.useMemo(
    () => [
      {
        Header: 'Pokémon ID',
        accessor: 'pkmn_id'
      },
      {
        Header: 'Pokédex No.',
        accessor: 'dex_num'          
      },
      {
        Header: 'Name',
        accessor: 'name'          
      },
      {
        Header: 'Type',
        accessor: 'type'          
      },
      {
        Header: 'Generation',
        accessor: 'gen'          
      },
      {
        Header: 'Size',
        accessor: 'size'          
      },
    ],
  )

  const data = []

  pkmn_generals.map(pkmn => {
    var pkmn_type = "";
    if (pkmn['type_2'] != null ? pkmn_type = pkmn['type_1'] + '/' + pkmn['type_2'] : pkmn_type = pkmn['type_1']);

    data.push(
      {
        "pkmn_id": pkmn['id'],
        "dex_num": pkmn['dex_num'],
        "name": pkmn['name'],
        "type": pkmn_type,
        "gen": pkmn['gen'],
        "size": pkmn['height'] + 'm and ' + pkmn['weight'] + 'kg'
      }
    )    
  })

  console.log(good_check)

  return (
    <div className='main-page'>
      <div className='pkmn-table-cont'>
        <div className='upper-cont'>
          <img id="pkmn_logo" src={logo} alt="pkmn_logo" />
          <div className='good-cont'> 
            <input type="checkbox" id="good_pkmn_box" name="good_pkmn" value="good_pkmn_check" onClick={() => setGoodCheck(!good_check)} />
            <label for="good_pkmn" id="good_pkmn_label">Only show good Pokémon!</label><br></br>
          </div>
          <div className='search-cont'> 
            <input type="text" id="ability_search" name="ability_search" placeholder="Search for an ability" onChange={(e) => setSearchText(e.target.value)}/>
          </div>
        </div>
        <Table columns={columns} data={data} />
      </div>
    </div>
  )
}

export default App;
