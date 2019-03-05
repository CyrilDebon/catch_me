
var timeout = 300;
var lastKeystroke = undefined;

var searchStop = function(input){
  var searchResult = document.getElementById("stop-search");
  searchResult.classList.remove('d-none');
  if (input.value.length == 0) {
    searchResult.classList.add('d-none');
  }
  if (input.value.length < 3) {
    return;
  }

  if (lastKeystroke) {
    clearInterval(lastKeystroke);
  }

  lastKeystroke = setTimeout(function(){
    Rails.fire(input.form, 'submit');
    lastKeystroke = undefined;
  }, timeout);

}

export { searchStop };
