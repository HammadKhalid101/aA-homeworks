import React from "react";

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {result: 0, num1: "", num2: ""};

    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.addNum = this.addNum.bind(this);
    this.subNum = this.subNum.bind(this);
    this.divNum = this.divNum.bind(this);
    this.multiplyNum = this.multiplyNum.bind(this);
    this.clear = this.clear.bind(this);
  }

  // your code here
  setNum1(event) {
    event.preventDefault();
    this.setState( { num1: event.currentTarget.value } );
  }

  setNum2(event) {
    event.preventDefault();
    this.setState( { num2: event.currentTarget.value } );
  }
  
  addNum(e) {
    e.preventDefault();
    this.setState( { result: parseInt(this.state.num1) + parseInt(this.state.num2) } )
  }
  
  subNum(e) {
    e.preventDefault();
    this.setState( { result: parseInt(this.state.num1) - parseInt(this.state.num2) } )
  }
  
  divNum(e) {
    e.preventDefault();
    this.setState( { result: parseInt(this.state.num1) / parseInt(this.state.num2) } )
  }
  
  multiplyNum(e) {
    e.preventDefault();
    this.setState( { result: parseInt(this.state.num1) * parseInt(this.state.num2) } )
  }

  clear(e) {
    e.preventDefault();
    this.setState( {result: 0, num1: "", num2: ""} );
  }

  render() {
    const { num1, num2 } = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input className="form-control form-control-sm" type="text" placeholder="Num 1 Here :)" onChange={this.setNum1} value={num1}></input>
        <input className="form-control form-control-sm" type="text" placeholder="Num 2" onChange={this.setNum2} value={num2}></input>

        <button type="button" className="btn btn-outline-primary btn-sm" data-toggle="tooltip" data-placement="bottom" title="Add" onClick={this.addNum}> + </button>
        <button type="button" className="btn btn-outline-secondary btn-sm" data-toggle="tooltip" data-placement="bottom" title="Subtract" onClick={this.subNum}> - </button>
        <button type="button" className="btn btn-outline-success btn-sm" data-toggle="tooltip" data-placement="bottom" title="Divide" onClick={this.divNum}> / </button>
        <button type="button" className="btn btn-outline-warning btn-sm" data-toggle="tooltip" data-placement="bottom" title="Multiply" onClick={this.multiplyNum}> * </button>

        <br />
        <button type="button" className="btn btn-danger" onClick={this.clear}> CLEAR! </button>
      </div>
    );
  };
};

export default Calculator;
