"use strict"

###
 # @ngdoc exports the map function which posts to the treemap service with tree name and location
 # @name treemap.controller:MainCtrl
 # @description
 #  MainCtrl
 # Controller for treemap
###
angular.module("treemap").controller "MainCtrl", [
  "$scope", "$http"
  ($scope, $http) ->

    navigator.geolocation.getCurrentPosition (position) ->

    map = (tree) ->
      navigator.geolocation.watchPosition (position) ->
        $http.post "http://localhost:3000/trees/tree/:id",
          longitude : position.coords.longitude
          latitude  : position.coords.latitude
          common    : tree.common
          binomial  : tree.binomial
        .then (res) -> res

    angular.extend $scope, {
      map
    }
]
