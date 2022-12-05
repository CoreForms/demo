(function () {
  var demo = window.demo = window.demo || {},
      priceCheckerID,
      gridID;

  demo.initialize = function () {
    priceCheckerID = demo.priceCheckerID;
    gridID = demo.gridID;
  };

  function isOverElement(currentElement, targetId) {
    while (currentElement) {
      if (currentElement.id === targetId)
        return currentElement;

      currentElement = currentElement.parentNode;
    }

    return null;
  }

  window.onDropping = function (sender, args) {
    var destNode = args.get_destNode();
    var destElement = args.get_htmlElement();

    if (destNode) return;

    if (!destElement) return;
    var priceChecker = isOverElement(destElement, priceCheckerID);
    var grid = isOverElement(destElement, gridID);

    if (priceChecker) {
      args.set_htmlElement(priceChecker);
      return;
    }
    else if (grid) {
      args.set_htmlElement(grid);
      return;
    }

    args.set_cancel(true);
  };
}());