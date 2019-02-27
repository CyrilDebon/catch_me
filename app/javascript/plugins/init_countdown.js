import _ from "underscore";
import moment from "moment";
import "moment-duration-format";

const initCountdown = () => {
  var stopEl = document.getElementById('stop');
  // get stop id
  var stopId = stopEl.dataset.stopId;
  var lineCode = stopEl.dataset.lineCode;

  var url = "https://ws.infotbm.com/ws/1.0/get-realtime-pass/" + stopId + "/" + lineCode;

  fetch(url).then(function(response){
    return response.json();
  }).then(function(data) {
    var arrival = handlePassages(data['destinations'])

    var eventTime = moment(arrival[0]['arrival']).unix();
    var currentTime = moment().unix();
    var diffTime = (eventTime - currentTime) * 1000;
    var duration = moment.duration(diffTime, 'milliseconds');
    var interval = 1000;

    var countdown = setInterval(function(){
      duration = moment.duration(duration - interval, 'milliseconds');
      $('#main-passage .countdown').html(duration.format("hh:mm:ss"));
    }, interval);


    setTimeout(function(){
      clearInterval(countdown);
      initCountdown();
    }, diffTime);
  });
}

function handlePassages(data) {
  return _.sortBy(_.flatten(_.map(data, function(value, key){
    return value;
  })), function(passage){
    return passage.waittime;
  });
}

export { initCountdown }

