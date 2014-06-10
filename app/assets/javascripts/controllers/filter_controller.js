FilterController = function(selectors) {

}

FilterController.prototype = {
  bindListeners: function() {
    $("#filters").on('click', this.renderCalculating)
    $('#filters').on('ajax:success', this.updatePhotosWithRemovedFilter)
  },
  removeAppliedFilters: function(event, data) {
    if (event.target.className === "primary_filters grid_1" ) {
      $("#"+ event.target.id).toggle()
    }
  },
  updatePhotosWithRemovedFilter: function(event, data) {
    $('#matched_tags').html(data["tags"])
    $('#photo_layout').html(data["photos"])
    $('#filters').html(data["filters"])
  },
  renderCalculating: function() {
    if (event.target.className === "primary_filters grid_1" ) {
      document.querySelector(".post_count").innerText = "calculating..."
    }

  }

}