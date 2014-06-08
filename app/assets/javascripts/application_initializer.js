initializeMainController = function() {
  var filterController = new FilterController()
  var tagController = new TagController()
  var toggleController = new ToggleController()
  new MainController(filterController,tagController, toggleController).initialize()
}