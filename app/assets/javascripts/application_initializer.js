initializeMainController = function() {
  var filterController = new FilterController()
  var tagController = new TagController()
  new MainController(filterController,tagController).bindListeners()
}