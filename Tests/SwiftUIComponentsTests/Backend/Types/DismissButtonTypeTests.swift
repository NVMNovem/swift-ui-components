import Foundation
import Testing
@testable import SwiftUIComponents

struct DismissButtonTypeTests {
    @Test func titles() {
        let cases: [(DismissButtonType, String)] = [
            (.cancel, "Cancel"),
            (.close, "Close"),
            (.done, "Done"),
            (.save, "Save"),
        ]

        for (buttonType, localizationKey) in cases {
            let expectedTitle = String(localized: String.LocalizationValue(localizationKey), table: "DismissToolbar", bundle: .module)
            #expect(buttonType.title == expectedTitle)
        }
    }

    @Test(arguments: ["en", "nl", "fr", "de"])
    func localizationIsBundled(language: String) throws {
        let expectedTranslations = [
            "en": ["Cancel": "Cancel", "Close": "Close", "Done": "Done", "Save": "Save"],
            "nl": ["Cancel": "Annuleren", "Close": "Sluiten", "Done": "Gereed", "Save": "Opslaan"],
            "fr": ["Cancel": "Annuler", "Close": "Fermer", "Done": "Terminé", "Save": "Enregistrer"],
            "de": ["Cancel": "Abbrechen", "Close": "Schließen", "Done": "Fertig", "Save": "Sichern"],
        ]
        #expect(Bundle.module.localizations.contains(language))
        let url = try #require(Bundle.module.url(
            forResource: "DismissToolbar",
            withExtension: "strings",
            subdirectory: nil,
            localization: language
        ))
        let data = try Data(contentsOf: url)
        let translations = try #require(
            PropertyListSerialization.propertyList(from: data, format: nil) as? [String: String]
        )

        #expect(translations == expectedTranslations[language])
    }
}
