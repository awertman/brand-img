window.onload = function() {
  $("#matched_tags").on('click', renderAppliedFilters)
  $('#matched_tags').on('ajax:success', updatePhotos)
  $('#matched_tags').on('ajax:error', errorRendering)
}

renderAppliedFilters = function() {
  console.log("applying filters")
  console.log(event.target.id)
}

updatePhotos = function() {
  console.log("ajax response")
  console.log(arguments)
}

errorRendering = function() {
  console.log("error")
  console.log(arguments)
}