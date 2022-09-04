Feature: Spartan Rest API: get spartan tests

  Background:
    #Given base url is set
    Given url spartan_base_url

  Scenario: Search for spartans using query params
    #And accept type is json
    Given header Accept = "application/json"
    ##And query param gender is Female
    And params { gender: 'Female'}
   # And query param nameContains is A     #or a not matter
    And params { nameContains: 'a'}
    #When I send get request to /spartans/search
    And path 'spartans/search'
    When method GET
   # Then status code is 200
    Then status 200
    #And content type is json
    And match header Content-Type == "application/json"
    #And total Element is 36
    And match response.totalElement == 36
    #And first spartan name is Paige
    And match response.content[0].name == "Paige"
    #And "Lorenza, Nona, Elisabeth" are among the names
   * def response = {name: 'Lorenza', name: 'Nona', name:'Elisabeth'}