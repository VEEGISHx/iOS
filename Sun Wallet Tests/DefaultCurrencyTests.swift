import XCTest
@testable import sunwallet

class DefaultCurrencyTests : XCTestCase {

    override func setUp() {
        UserDefaults.standard.removeObject(forKey: "defaultcurrency")
    }

    func testInitialValue() {
        guard let localCurrency = Locale.current.currencyCode else {
            XCTFail("We should have a local currency")
            return
        }
        XCTAssertTrue(localCurrency == UserDefaults.defaultCurrencyCode, "Default currency should be equal to the local currency by default")
    }

    func testUpdate() {
        UserDefaults.defaultCurrencyCode = "EUR"
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "EUR", "Default currency should update.")
    }

    func testAction() {
        UserDefaults.defaultCurrencyCode = "USD"
        let store = Store()
        store.perform(action: DefaultCurrency.setDefault("CAD"))
        XCTAssertTrue(UserDefaults.defaultCurrencyCode == "CAD", "Actions should persist new value")
    }
    
}