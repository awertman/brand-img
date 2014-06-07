document.addEventListener("DOMContentLoaded", function() { /// this needs to be loaded on page load instea
  console.log("content loaded")
  $("#matched_tags").on('click', renderAppliedFilters)
  $('#matched_tags').on('ajax:success', updatePhotosWithAddedFilter)
  $('#matched_tags').on('ajax:error', errorRendering)


  $("#filters").on('click', removeAppliedFilters)
  $('#filters').on('ajax:success', updatePhotosWithRemovedFilter)
  $('#filters').on('ajax:error', errorRendering)
})

renderAppliedFilters = function() {
  if (event.target.className === "primary_tags grid_2" ) {
    clonedButton = $("#"+ event.target.id).clone()
    clonedButton.className = "primary_filters grid_2"
    $("#filters").append(clonedButton)
  }
}

updatePhotosWithAddedFilter = function(event, data) {
  $('#matched_tags').html(data["tags"])
  $('#photo_layout').html(data["photos"])
  $('#filters').html(data["filters"])
}

errorRendering = function(event, data) {
  console.log("error")
  console.log(arguments)
}

removeAppliedFilters = function(event, data) {
  if (event.target.className === "primary_filters grid_2" ) {
    $("#"+ event.target.id).toggle()
  }

}

updatePhotosWithRemovedFilter = function(event, data) {
  $('#matched_tags').html(data["tags"])
  $('#photo_layout').html(data["photos"])
  $('#filters').html(data["filters"])
}

MainController = function() {
  console.log("initializing main controller")
}

MainController.prototype = {

}