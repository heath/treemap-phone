"use strict"

describe "Controller: MainCtrl", ->

  # load the controller's module
  beforeEach module "treemap"

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller "MainCtrl", $scope: scope

  it "will have a test someday", ->
    expect(true).toBe true
