FilterController = function(selectors) {

}

FilterController.prototype = {
  bindFilterListener: function() {
    $("#filters").on('click', this.removeAppliedFilters)
    $('#filters').on('ajax:success', this.updatePhotosWithRemovedFilter)
  },
  removeAppliedFilters: function(event, data) {
    if (event.target.className === "primary_filters grid_2" ) {
      $("#"+ event.target.id).toggle()
    }
  },
  updatePhotosWithRemovedFilter: function(event, data) {
    $('#matched_tags').html(data["tags"])
    $('#photo_layout').html(data["photos"])
    $('#filters').html(data["filters"])
  }

}