<%--
  Created by IntelliJ IDEA.
  User: HoangHuy
  Date: 4/25/2019
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>MAP</title>
    <style>
        /* Always set the map height explicitly to define the size of the div
         * element that contains the map. */
        #map {
            height: 100%;
        }

        /* Optional: Makes the sample page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<div id="map"></div>
<script>
    var map;

    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: {lat: -34.397, lng: 150.644},
            zoom: 8
        });
    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyCQLGk2q-ZXjRJgpSgT1nHz0CSgXoqTkXk&callback=initMap"
        async defer></script>
<script>
    $(function () {
        $(".sidebar .nav li:first-child").removeClass("active");
        $(".sidebar .nav li:nth-child(2)").removeClass("active");
        $(".sidebar .nav li:nth-child(3)").removeClass("active");
        $(".sidebar .nav li:nth-child(4)").removeClass("active");
        $(".sidebar .nav li:nth-child(5)").removeClass("active");
        $(".sidebar .nav li:nth-child(6)").addClass("active");
        $(".sidebar .nav li:nth-child(7)").removeClass("active");
    })
</script>
</body>
</html>
