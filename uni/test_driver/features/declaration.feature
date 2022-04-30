Feature: Declaration
    The declaration text should appear when the respective button is pressed

    Scenario: "Multiusos" declaration appears when it's button is pressed
        Given That the declaration text is empty
        When I tap the "multiusos" button
        Then I expect the declaration text to not be empty
        And I expect the declaration text to have the text related to the "multiusos" declaration