//
//  MockingDemoUITests.swift
//  MockingDemoUITests
//
//  Created by Meric Alp on 28.03.2023.
//

import XCTest

final class when_user_click_on_login_button: XCTestCase {
    
    private var app: XCUIApplication!
    private var PageloginObject: LoginPageObject!
    
    override func setUp() {
        app = XCUIApplication()
        PageloginObject = LoginPageObject(app: app)
        continueAfterFailure = false
        app.launchEnvironment = ["ENV": "TEST"]
        app.launch()
    }
    
    func test_should_display_error_message_for_missing_required_fields() {
        
        let usernameTextField = PageloginObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("")
        
        let passwordTextField = PageloginObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("")
        
        let loginButton = PageloginObject.loginButton
        loginButton.tap()
        
        let messageText = PageloginObject.messageText
        XCTAssertEqual(messageText.label, "Required fields are missing")
        
    }
    
    func test_should_display_error_message_for_invalid_credentials(){
        let usernameTextField = PageloginObject.usernameTextField
        usernameTextField.tap()
        usernameTextField.typeText("Alp")
        
        let passwordTextField = PageloginObject.passwordTextField
        passwordTextField.tap()
        passwordTextField.typeText("WrongPassword")
        
        let loginButton = PageloginObject.loginButton
        loginButton.tap()
        
        let messageText = PageloginObject.messageText
        XCTAssertEqual(messageText.label, "Invalid credentials")
    }
    
    
    func test_should_navigate_to_dashboard_page_when_authenticated() {
        
        let usernameTextField = app.textFields["usernameTextField"]
        usernameTextField.tap()
        usernameTextField.typeText("MericAlp")
        
        let passwordTextField = app.textFields["passwordTextField"]
        passwordTextField.tap()
        passwordTextField.typeText("Password")
        
        let loginButton = app.buttons["loginButton"]
        loginButton.tap()
        
        let dashboardNavBarTitle = app.staticTexts["Dashboard"]
        XCTAssertTrue(dashboardNavBarTitle.waitForExistence(timeout: 0.5))
        
    }
    
    
   
}

