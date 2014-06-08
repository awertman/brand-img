TagController = function(selectors) {

}

TagController.prototype = {
  bindListeners: function() {
    $("#matched_tags").on('click', this.renderAppliedFilters.bind(this))
    $('#matched_tags').on('ajax:success', this.updatePhotosWithAddedFilter)
  },
  renderAppliedFilters: function() {
    if (event.target.className === "primary_tags grid_1" ) {
      clonedButton = $("#"+ event.target.id).clone()
      clonedButton.className = "primary_filters grid_1"
      $("#filters").append(clonedButton)
      this.renderCalculating()
    }
  },
  updatePhotosWithAddedFilter: function(event, data) {
    $('#matched_tags').html(data["tags"])
    $('#photo_layout').html(data["photos"])
    $('#filters').html(data["filters"])
  },
  renderCalculating: function() {
    if( document.querySelector(".post_count") ) {
      document.querySelector(".post_count").innerText = "calculating..."
    }
  }


}