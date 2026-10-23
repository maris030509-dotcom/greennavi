document.addEventListener("turbo:load", () => {
  const mapElement = document.getElementById("map");

  console.log("mapElement", mapElement);

  if (!mapElement) return;

  const lat = parseFloat(mapElement.dataset.lat);
  const lng = parseFloat(mapElement.dataset.lng);

  const position = {
    lat: lat,
    lng: lng
  };

  const map = new google.maps.Map(mapElement, {
    zoom: 15,
    center: position
  });

  new google.maps.Marker({
    position: position,
    map: map
  });
});