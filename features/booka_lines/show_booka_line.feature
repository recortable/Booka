Feature: Show booka line
  In order to find projects related
  As a booka user
  I want to see the projects of a booka line

  Background:
    Given the booka line "Proyectos"

  Scenario:
    Given the project "Proyecto Uno" inside line "Proyectos"
    When I go to "Proyectos" booka line page
    Then I should see "Proyectos"
    Then I should see "Proyecto Uno"
