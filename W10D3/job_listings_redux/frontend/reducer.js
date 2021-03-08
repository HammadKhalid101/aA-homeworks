const initialState = {
  city: "Please Select", 
  jobs: []

};

const reducer = (state = initialState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case "SWITCH_LOCATION":
      let newState = Object.assign({}, state, {jobs: action.jobs, city: action.city})
      return newState;
    default:
      return state;
  }
};
window.reducer = reducer;
export default reducer;
