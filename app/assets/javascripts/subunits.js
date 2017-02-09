$(document).on('turbolinks:load', function () {
    var map = null;
    var mapOptions = {
        disableDefaultUI: true,
        zoom: 16,
        center: new google.maps.LatLng(-33.440794, -70.655469),
        streetViewControl: false,
        scrollwheel: false,
        styles: [
            {
                "featureType": "poi",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#747474"
                    }, {
                        "lightness": "23"
                    }
                ]
            }, {
                "featureType": "poi.attraction",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#f38eb0"
                    }
                ]
            }, {
                "featureType": "poi.government",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ced7db"
                    }
                ]
            }, {
                "featureType": "poi.medical",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffa5a8"
                    }
                ]
            }, {
                "featureType": "poi.park",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#c7e5c8"
                    }
                ]
            }, {
                "featureType": "poi.place_of_worship",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#d6cbc7"
                    }
                ]
            }, {
                "featureType": "poi.school",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#c4c9e8"
                    }
                ]
            }, {
                "featureType": "poi.sports_complex",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#b1eaf1"
                    }
                ]
            }, {
                "featureType": "road",
                "elementType": "geometry",
                "stylers": [
                    {
                        "lightness": "100"
                    }
                ]
            }, {
                "featureType": "road",
                "elementType": "labels",
                "stylers": [
                    {
                        "visibility": "off"
                    }, {
                        "lightness": "100"
                    }
                ]
            }, {
                "featureType": "road.highway",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffd4a5"
                    }
                ]
            }, {
                "featureType": "road.arterial",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "color": "#ffe9d2"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "all",
                "stylers": [
                    {
                        "visibility": "simplified"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "geometry.fill",
                "stylers": [
                    {
                        "weight": "3.00"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "geometry.stroke",
                "stylers": [
                    {
                        "weight": "0.30"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "labels.text",
                "stylers": [
                    {
                        "visibility": "on"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "labels.text.fill",
                "stylers": [
                    {
                        "color": "#747474"
                    }, {
                        "lightness": "36"
                    }
                ]
            }, {
                "featureType": "road.local",
                "elementType": "labels.text.stroke",
                "stylers": [
                    {
                        "color": "#e9e5dc"
                    }, {
                        "lightness": "30"
                    }
                ]
            }, {
                "featureType": "transit.line",
                "elementType": "geometry",
                "stylers": [
                    {
                        "visibility": "on"
                    }, {
                        "lightness": "100"
                    }
                ]
            }, {
                "featureType": "water",
                "elementType": "all",
                "stylers": [
                    {
                        "color": "#d2e7f7"
                    }
                ]
            }
        ]
    };

    var geocoder = new google.maps.Geocoder();
    var address = "<%= @subunit.property.address %>, Santiago, Chile"
    geocoder.geocode({
        'address': address
    }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({map: map, position: results[0].geometry.location});
        }
    })

    if (document.getElementById("subunit_map_square")) {
        map = new google.maps.Map(document.getElementById("subunit_map_square"), mapOptions);
    }
});
