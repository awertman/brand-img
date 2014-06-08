ToggleController = function() {

}

ToggleController.prototype = {
  bindListeners: function() {
    document.querySelector('#toggle_filter').addEventListener('click', this.toggleDisplay)
  },
  toggleDisplay: function() {
    $('#matched_tags').toggle()
  }
}