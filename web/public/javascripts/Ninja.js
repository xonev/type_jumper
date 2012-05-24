(function() {
  var NT;

  NT = window.NT || {};

  window.NT = NT;

  NT.Ninja = (function() {

    function Ninja(displayObj, x, y) {
      this.displayObj = displayObj;
      this.x = x;
      this.y = y;
      this.displayObj.x = this.x;
      this.displayObj.y = this.y;
    }

    Ninja.prototype.getDisplayObject = function() {
      return this.displayObj;
    };

    return Ninja;

  })();

}).call(this);
