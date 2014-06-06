document.addEventListener("DOMContentLoaded", function() { /// this needs to be loaded on page load instea
  console.log("content loaded")
  $("#matched_tags").on('click', renderAppliedFilters)
  $('#matched_tags').on('ajax:success', updatePhotos)
  $('#matched_tags').on('ajax:error', errorRendering)
})

renderAppliedFilters = function() {
  console.log("applying filters")
  console.log(event.target.id)
}

updatePhotos = function(event, data) {
  console.log("ajax response")
  console.log(data["html"])
  $('#matched_tags').html(data["tags"])
  $('#photo_layout').html(data["photos"])
}

errorRendering = function(event, data) {
  console.log("error")
  console.log(arguments)
}