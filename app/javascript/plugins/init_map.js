import Rails from 'rails-ujs';

function initMap() {
  const showMapBtn = document.getElementById('show-map');

  if (showMapBtn) {
    showMapBtn.addEventListener('click', function(e) {
      e.preventDefault();
      showMapBtn.classList.add('rotating-spinner');
      navigator.geolocation.getCurrentPosition(function(data) {
        Rails.ajax({
          type: "GET",
          url: "/maps?lat=" + data.coords.latitude + "&lng=" + data.coords.longitude,
          success: function(data){
            // set close button
            showMapBtn.classList.remove('rotating-spinner');
            eval(data);
          }
        })
      });
    });
  }
}

export { initMap };
