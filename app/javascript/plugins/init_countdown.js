import _ from "underscore";
import moment from "moment";
import "moment-duration-format";

const initCountdown = () => {
  var stopEl = document.getElementById('stop');
  var stopId = stopEl.dataset.stopId;
  var lineCode = stopEl.dataset.lineCode;
  var interval = 1000;
  var url = "https://ws.infotbm.com/ws/1.0/get-realtime-pass/" + stopId + "/" + lineCode;

  fetch(url).then(function(response){
    return response.json();
  }).then(function(data) {
    var passages = handlePassages(data['destinations'])

    var mainPassage = passages[0];
    var nextPassages = passages.slice(1);

    // HANDLE MAIN PASSAGE
    var eventDestination = mainPassage['destination_name'];
    $('#main-passage .destination').html(eventDestination);

    var eventTime = moment(mainPassage['arrival']).unix();
    var currentTime = moment().unix();
    var mainDiffTime = (eventTime - currentTime) * 1000;
    var duration = moment.duration(mainDiffTime, 'milliseconds');

    $('#main-passage .countdown').html(duration.format("hh:mm:ss"));

    var mainCountdown = setInterval(function(){
      duration = moment.duration(duration - interval, 'milliseconds');
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
    `)

    nextPassages.forEach(function(passage, index){
      var destination = passage['destination_name'];
      var id = "passage-" + (index + 1);
      var nextPassage = nextPassageTemplate({ id: id, destination: destination });
      $('#next-passages').append(nextPassage);

      var eventTime = moment(passage['arrival']).unix();
      var diffTime = (eventTime - currentTime) * 1000;
      var duration = moment.duration(diffTime, 'milliseconds');

      $('#' + id + ' .countdown').html(duration.format("hh:mm") + " min");

      var countdown = setInterval(function(){
        duration = moment.duration(duration - interval, 'milliseconds');
        $('#' + id + ' .countdown').html(duration.format("hh:mm") + " min");
      }, interval);

      nextCountdowns.push(countdown);
    });

    setTimeout(function(){
      clearInterval(mainCountdown);
      nextCountdowns.forEach(function(countdown){
        clearInterval(countdown);
      });

      initCountdown();
    }, mainDiffTime);

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

