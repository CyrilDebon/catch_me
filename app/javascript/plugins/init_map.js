import Rails from 'rails-ujs';

function initMap() {
  const showMapBtn = document.getElementById('show-map');

  if (showMapBtn) {
    showMapBtn.addEventListener('click', function(e) {
      e.preventDefault();
      navigator.geolocation.getCurrentPosition(function(data) {
        Rails.ajax({
          type: "GET",
          url: "/maps?lat=" + data.coords.latitude + "&lng=" + data.coords.longitude,
          success: function(data){
            eval(data);
          }
        })
      });
    });
  }
}

export { initMap };
