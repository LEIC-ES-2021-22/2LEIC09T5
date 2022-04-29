Feature: Declaration
    The declaration text should appear when the respective button is pressed

    Scenario: "Multiusos" declaration appears when it"s button is pressed
        Given I expect the "declarationText" to be empty
        When I tap the "multiusos" button
        Then I expect the "declarationText" to not be empty