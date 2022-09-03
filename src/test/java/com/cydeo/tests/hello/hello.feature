
 Feature: Hello world feature

  Scenario: User is able to see hello world greeting
   Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
   When method GET
   Then status 200
 # verify message is "Hello World!"
   And match response.message == "Hello World!"
