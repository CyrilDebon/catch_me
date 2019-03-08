import _ from "underscore";
import moment from "moment";
import "moment-duration-format";

var oldTripId = undefined;

const initCountdown = () => {
  var stopEl = document.getElementById('stop');
  if (!stopEl) { return; }
  var stopId = stopEl.dataset.stopId;
  var lineCode = stopEl.dataset.lineCode;
  var interval = 1000;
  var url = "https://ws.infotbm.com/ws/1.0/get-realtime-pass/" + stopId + "/" + lineCode;
  var stopEl = document.getElementById("stop");
  var animEl = document.querySelector('.animation-icon');

  fetch(url).then(function(response){
    return response.json();
  }).then(function(data) {
    var passages = handlePassages(data['destinations'])

    var mainPassage = passages[0];
    var nextPassages = passages.slice(1);

    var newTripId = mainPassage['trip_id'];

    if ((oldTripId != undefined) && (oldTripId != newTripId)) {
      animEl.classList.add('animation-icon-departing');
      animEl.classList.remove('animation-icon-arriving');
    }

    oldTripId = newTripId;

    // HANDLE MAIN PASSAGE
    var eventDestination = mainPassage['destination_name'];
    $('#stop-destination').html(eventDestination);

    var eventTime = moment(mainPassage['departure']).unix();

    var currentTime = moment().unix();
    var mainDiffTime = (eventTime - currentTime) * 1000;
    var duration = moment.duration(mainDiffTime, 'milliseconds');

    if (duration > 40000) {
      stopEl.classList.remove('stop-danger');
    }

    $('#main-passage .countdown').html(duration.format("hh:mm:ss"));

    var mainCountdown = setInterval(function(){
      duration = moment.duration(duration - interval, 'milliseconds');
      if (duration <= 40000) {
        stopEl.classList.add('stop-danger');
      }
      if (duration < 30000) {
        animEl.classList.remove('animation-icon-departing');
        animEl.classList.add('animation-icon-arriving');
      }

      $('#main-passage .countdown').html(duration.format("hh:mm:ss"));
    }, interval);

    // HANDLE NEXT PASSAGES
    $('#next-passages').html('');
    var nextCountdowns = [];
    var nextPassageTemplate = _.template(`
      <div class='passage d-flex justify-content-between' id='<%= id %>'>
        <div class='countdown'></div>
        <div class='destination'><%= destination %></div>
      </div>
    `);

    nextPassages.forEach(function(passage, index){
      var destination = passage['destination_name'];
      var id = "passage-" + (index + 1);
      var nextPassage = nextPassageTemplate({ id: id, destination: destination });
      $('#next-passages').append(nextPassage);

      var eventTime = moment(passage['departure']).unix();
      var diffTime = (eventTime - currentTime) * 1000;
      var duration = moment.duration(diffTime, 'milliseconds');

      $('#' + id + ' .countdown').html(duration.format("hh:mm") + " min");

      var countdown = setInterval(function(){
        duration = moment.duration(duration - interval, 'milliseconds');
        $('#' + id + ' .countdown').html(duration.format("hh:mm") + " min");
      }, interval);

      nextCountdowns.push(countdown);
    });

    var refetchTime = 30 * interval;

    // var nextFetch = (mainDiffTime < refetchTime) ? mainDiffTime : refetchTime;
    var nextFetch = mainDiffTime;

    setTimeout(function(){
      clearInterval(mainCountdown);
      nextCountdowns.forEach(function(countdown){
        clearInterval(countdown);
      });

      initCountdown();
    }, nextFetch);

  });
}





function handlePassages(data) {
  return _.sortBy(_.flatten(_.map(data, function(value, key){
    return value;
  })), function(passage){
    return passage.waittime;
  });
}


export { initCountdown };



