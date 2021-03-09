import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({giphys}) => {
    // debugger
    return (
        <div>
            {giphys.map((gif, idx) =>{
                return <GiphysIndexItem key={idx} gif={gif}/>
            })}
        </div>
    )
}

export default GiphysIndex;
