##### Karate

Test Automation Made Simple.




Given the chance If there is no automation framework in place.
I will demo 2,3 different versions of framework and as a team we can decide
the best fit for our project.

If they have framework, I will learn the structure and design of the existing framework and advice if I see any ways we can improve it.

if there is existing framework:
-> you get chance to learn new styles of framework
-> utils, base classes etc are ready
-> takes some effort to learn and adapt
-> build good relation with with coworkers

if there is no existing framework:
-> you are the owner of the framework
-> easy way to get recognized in the team
-> copy and add your school template framework
-> add some basic tests(login/logout etc), demo
====================================================

In stand up: Still working in the store 1234 - I think I need some dev support here.

CI/CD -> Jenkins
=====================

Nowadays, automation is very popular and standard practice in software development, there are many tool and framework options:

Automation tools:
-> open source: Selenium, Protractor, Cucumber, Cypress, Testcafe etc
-> very customizable
-> no customer support
etc
-> licensed : HP LeanFT, UFT, Smartbear ReadyAPI, TestComplete, ibm etc
-> not so customizable
-> there is technical support
-> secure

Automation Frameworks:
-> custom build your own using open source automation tools:
selenium, restassured, java, maven, cucumber, POM etc
-> Pre-built automation frameworks:
-> karate framework
-> serenity framework
-> neodymium
-> selenide
-> carina

Codeless automation tools:
-> record and playback
-> IA based locators that self heal
-> no coding skills needed

Performance testing tools:
-> Jmeter
-> locust
-> gatling

Karate -> Make automation easy

-> BDD based framework. We write feature files
-> Supports: API, UI, Performance, Desktop applications automation

API -> Karate
UI -> Selenium
============================

API framework is RestAssured and java based

However I did some smoke test automation using Karate framework for one of our services.

============================

Karate framework structure:
we write All our tests in feature files using gherkin keywords and Karate keywords.

	Given url 'https://jsonplaceholder.typicode.com/users'
    When method get
    Then status 200

Then we just run the feature file, there is no need for step definitions class.

configuration:
karate-config.js
it is java script class, and used for configurations like storing urls, environments. similar to configuration.properties

Runner class:
It is optional to have runner classes, but we can add:

	class UsersRunner {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }

}
	
=============================================================

Given url 'https://sandbox.api.service.nhs.uk/hello-world/hello/world'
When method GET
Then status 200
# verify message is "Hello World!"
And match response.message == "Hello World!"

karate keywords:
REQUEST:
url 'api url' => is used to set base url/whole endpoint of api request
When method GET => is used to send a request. GET/PUT/POST/DELETE/PATCH

	RESPONSE:
	Then status 200 => verify status code is 200 ok

	match => this keyword is used to perform response validations.
	We can assert values in json body, headers

    match response.message == "Hello World!"

    response keyword is used to access response object with details. 
    response.message => it is extracting "message" key value from json body.
	== "Hello World!" => checking for equality
	=============================

Given base url is .....
And header accept type is json
When I send GET request to /spartans
Then status code should be 200
And content type should be application json
And print the response

Background:
Given url spartan_base_url

Scenario: Get all spartans
Given header Accept = "application/json"
And path "/spartans"
When method GET
Then status 200
And match header Content-Type == "application/json"
And print "hello batch 26 Friends!"
And print response

Domain Specific language -> DSL

Scenario: Get single spartan and verify data

Given base url is set
And accept type is json
And path param id is 2
When I send get request to /spartans/{id}
Then status code is 200
And content type is json
And body   {
"id" is 2,
"name" is "Nels",
"gender": is "Male",
"phone": is 4218971348
}

Scenario: Get single spartan and verify data
Given header Accept = "application/json"
And path "/spartans/" , 2
When method GET
Then status 200
And match header Content-Type == "application/json"
#{"id":2,"name":"Nels","gender":"Male","phone":4218971348}
And match response.id == 2
And match response.name == "Nels"
And match response.gender == "Male"
And match response.phone == 4218971348
And match response == {id:2, name:"Nels", gender:"Male", phone:4218971348}
* def spartanId = response.id
* print "spartan ID = " + spartanId
* match spartanId == 2


Scenario: Search for spartans using query params

Given base url is set
And accept type is json
And query param gender is Female
And query param nameContains is A
When I send get request to /spartans/search
Then status code is 200
And content type is json
And total Element is 32
And first spartan name is Jaimie
And "Lorenza, Nona, Elizabeth" are among the names
































