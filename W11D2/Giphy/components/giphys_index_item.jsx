import React from 'react';

const GiphysIndexItem = ({gif}) => {
    return (
        <div>
            <img src={gif.images.original.url} alt="why are they broken"/>
        </div>
    )
}

export default GiphysIndexItem;