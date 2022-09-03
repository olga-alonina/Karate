
 Feature: Hello world feature

  Scenario: User is able to see hello world greeting
   Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
   When method GET
   Then status 200
 # verify JSON body message is "Hello World!"
   And match response.message == "Hello World!"
   #verify HEADER content type is "application/json; charset=UTF-8"
   And match header Content-Type == "application/json; charset=UTF-8"
   #verify header Content-Length equals to 32
   And match header Content-Length == '32'
