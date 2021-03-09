

export const fetchSearchGiphys = (dog) => {
    return $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${dog}&api_key=UpGOn3uUIIKfXRGQ3y8syWh9ARmhYP72&limit=2`,
        
    })
}