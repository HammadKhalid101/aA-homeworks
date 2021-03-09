import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            searchTerm: "golden"
        }
        this.handleClick = this.handleClick.bind(this);
        this.handleChange = this.handleChange.bind(this);
    }

    handleChange(e) {
        this.setState({
            searchTerm: e.target.value,
        })
    }

    handleClick(e) {
        e.preventDefault();
        this.props.fetchSearchGiphys(this.state.searchTerm)
    }

    componentDidMount() {
        this.props.fetchSearchGiphys("golden")
    }

    render() {
        let {giphys} = this.props;

        return (
            <div>
                <form onSubmit={this.handleClick}>
                    <label>Search
                        <input type="text" name="" onChange={this.handleChange}/>
                    </label>
                    <button>Find em'</button>
                </form>

                <GiphysIndex giphys={giphys}/>
            </div>
        )
    }
}

export default GiphysSearch;