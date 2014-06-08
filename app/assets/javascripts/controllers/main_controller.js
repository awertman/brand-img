document.addEventListener("DOMContentLoaded", function() {})

MainController = function(filterController, tagController, toggleController) {
  this.filterController = filterController
  this.tagController = tagController
  this.toggleController = toggleController
  this.controllerHolder = [filterController, tagController, toggleController]
}

MainController.prototype = {
  initialize: function() {
    for (var i in this.controllerHolder) {
      this.controllerHolder[i].bindListeners()
    }
  }
}
