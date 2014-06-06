document.addEventListener("DOMContentLoaded", function() { /// this needs to be loaded on page load instea
  console.log("content loaded")
  $("#matched_tags").on('click', renderAppliedFilters)
  $('#matched_tags').on('ajax:success', updatePhotos)
  $('#matched_tags').on('ajax:error', errorRendering)
})

renderAppliedFilters = function() {
  if (event.target.className === "primary_tags grid_2" ) {
      clonedButton = $("#"+ event.target.id).clone()
      clonedButton.className = "primary_filters grid_2"
      $("#filters").append(clonedButton)
    }
}

updatePhotos = function(event, data) {
  console.log("ajax response")
  $('#matched_tags').html(data["tags"])
  $('#photo_layout').html(data["photos"])
}

errorRendering = function(event, data) {
  console.log("error")
  console.log(arguments)
}