import Rails from 'rails-ujs';

function initMap() {
  const showMapBtn = document.getElementById('show-map');

  console.log(showMapBtn);


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
            showMapBtn.classList.add('d-none');
            eval(data);
            var hideMapbtn = document.getElementById('hide-map');
            hideMapbtn.addEventListener('click', function(e) {
              var mapWrapper = document.getElementById('map-wrapper');
              mapWrapper.classList.add('d-none');
              showMapBtn.classList.remove('rotating-spinner');
              showMapBtn.classList.remove('d-none');
            })

          }
        })
      });
    });
  }
}

export { initMap };
