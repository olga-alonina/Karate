
  Feature: Spartan Rest API: get spartan tests

    Background:
      Given url spartan_base_url

    Scenario: Get all spartans
      Given header Accept = "application/json"
      And path "/spartans"
      When method GET
      Then status 200


