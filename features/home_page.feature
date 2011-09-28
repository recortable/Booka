Feature: Home page
  In order to get some information about Booka
  As a visitor
  I want to see a homepage

  Scenario: Go to home page
    When I go to the home page
    # TODO: Post ... should refactor this
    Then I should see "Bienvenido a Booka"
