document.addEventListener("DOMContentLoaded", function() {})

MainController = function(filterController, tagController) {
  this.filterController = filterController
  this.tagController = tagController
}

MainController.prototype = {
  bindListeners: function() {
    this.filterController.bindFilterListener()
    this.tagController.bindTagListener()
  }
}
