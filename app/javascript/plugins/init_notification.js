import moment from "moment";
import * as Cookies from "js-cookie";

function snooze() {
  var in30Minutes = new Date(new Date().getTime() + 30 * 60 * 1000);
  Cookies.set('snoozed', true, { expires: in30Minutes, path: '/' });
}

function initNotification() {
  var favoritesCount = parseInt(document.getElementById('favorites-stop').dataset.favoritesCount);

  if (favoritesCount <= 0) {
    return;
  }
  if (Cookies.get('snoozed')) {
    return;
  }

  navigator.geolocation.getCurrentPosition(function(data) {
    Rails.ajax({
      type: "GET",
      accept: 'json',
      url: "/stops/near?lat=" + data.coords.latitude + "&lng=" + data.coords.longitude,
      success: function(data) {
        var stopEl = document.getElementById('stop');

        if ((stopEl) && (stopEl.dataset.stopId == data.stop_id)) {
          return;
        }
        document.body.insertAdjacentHTML('beforeend', data.html);

        setTimeout(function(){
          document.querySelector(".notification").classList.add('notification-show');
        }, 1);

        var linkEl = document.querySelector(".notification .slat-link");
        linkEl.addEventListener('click', function(e) {
          e.preventDefault();
          snooze();
          window.location = linkEl.href;
        });
        document.querySelector(".notification .snooze").addEventListener('click', function(e) {
          e.preventDefault();
          snooze();
          document.querySelector('.notification').classList.add('notification-hidden');
        })
      }
    });
  });
}

export { initNotification };
