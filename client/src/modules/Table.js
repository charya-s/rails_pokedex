import React, { useState } from 'react';

import Info_Popup from './Info_Popup';

import { useTable, usePagination } from 'react-table';

function Table({ columns, data }) {
    // Use the state and functions returned from useTable to build your UI
    const {
        getTableProps,
        getTableBodyProps,
        headerGroups,
        prepareRow,
        page,
        canPreviousPage,
        canNextPage,
        pageOptions,
        pageCount,
        gotoPage,
        nextPage,
        previousPage,
        setPageSize,
        allColumns,
        state: { pageIndex, pageSize },
    } = useTable(
        {
            columns,
            data,
            initialState: { pageIndex: 0, pageSize: 10 },
            hiddenColumns: ["pkmn_id"],
        },
        usePagination
    )

    const [popup_data, setPopupData] = useState(null)
  
    // Render the UI for your table
    return (
        <div>
            {popup_data != null ? <Info_Popup pkmn_id={popup_data}/> : ""}
            <table className="table" id="pkmn_table" {...getTableProps()} style={popup_data != null ? {filter: "blur(3px)"} : {}} onClick={() => popup_data != null ? setPopupData(null) : ""}>
                <thead>
                    {headerGroups.map(headerGroup => (
                        <tr {...headerGroup.getHeaderGroupProps()}>
                            {headerGroup.headers.map(column => (
                                <th id={column.render('Header')} {...column.getHeaderProps()}>{column.render('Header')}</th>
                            ))}
                        </tr>
                    ))}
                </thead>
                <tbody {...getTableBodyProps()}>
                    {page.map((row, i) => {
                        prepareRow(row)
                        return (
                            <tr {...row.getRowProps()} onClick={() => setPopupData(row['cells'][0]['value'])}>
                                {row.cells.map(cell => {
                                    return <td {...cell.getCellProps()}>{cell.render('Cell')}</td>
                                })}
                            </tr>
                        )
                    })}
                </tbody>
            </table>
            {/* 
        Pagination can be built however you'd like. 
        This is just a very basic UI implementation:
      */}
            <ul className="pagination" style={popup_data != null ? {filter: "blur(3px)"} : {}} onClick={() => popup_data != null ? setPopupData(null) : ""}>
                <li className="page-item" id="first_item" onClick={() => gotoPage(0)} disabled={!canPreviousPage}>
                    <button className="page-link">{'<<'}</button>
                </li>
                <li className="page-item" onClick={() => previousPage()} disabled={!canPreviousPage}>
                    <button className="page-link">{'<'}</button>
                </li>
                <li className="page-item" onClick={() => nextPage()} disabled={!canNextPage}>
                    <button className="page-link">{'>'}</button>
                </li>
                <li className="page-item" onClick={() => gotoPage(pageCount - 1)} disabled={!canNextPage}>
                    <button className="page-link">{'>>'}</button>
                </li>
                <li className="page-num" id="last_item">
                    Page{' '}
                    <strong>
                      {pageIndex + 1} of {pageOptions.length}
                    </strong>{' '}
                </li>{' '}
                <select
                    className="form-control"
                    value={pageSize}
                    onChange={e => {
                        setPageSize(Number(e.target.value))
                    }}
                    style={{ width: '120px', height: '38px' }}
                >
                    {[10, 25, 50, 100].map(pageSize => (
                        <option key={pageSize} value={pageSize}>
                            Show {pageSize}
                        </option>
                    ))}
                </select>
            </ul>
        </div >
    )
}

export default Table;