window.onload = function() {
  document.querySelector("#matched_tags").addEventListener("click", addFilter,false)
}

addFilter = function() {
  console.log(event.target.id)
}