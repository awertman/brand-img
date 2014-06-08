TagController = function(selectors) {

}

TagController.prototype = {
  bindTagListener: function() {
    $("#matched_tags").on('click', this.renderAppliedFilters)
    $('#matched_tags').on('ajax:success', this.updatePhotosWithAddedFilter)
  },
  renderAppliedFilters: function() {
    if (event.target.className === "primary_tags grid_2" ) {
      clonedButton = $("#"+ event.target.id).clone()
      clonedButton.className = "primary_filters grid_2"
      $("#filters").append(clonedButton)
    }
  },
  updatePhotosWithAddedFilter: function(event, data) {
    $('#matched_tags').html(data["tags"])
    $('#photo_layout').html(data["photos"])
    $('#filters').html(data["filters"])
  }

}