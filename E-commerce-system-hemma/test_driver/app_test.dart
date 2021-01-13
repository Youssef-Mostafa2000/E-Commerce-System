import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("Flutter Auth App Test", () {
    final emailField = find.byValueKey("email-field");
    final passwordField = find.byValueKey("password-field");
    final signInButton = find.text("Sign in");
    final homepage = find.byType("HomePage");
    final snackbar = find.byType("SnackBar");

    FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
      await driver.waitUntilFirstFrameRasterized();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test(
        "login fails with incorrect email and password, provides snackbar feedback",
        () async {
      await driver.tap(emailField);
      await driver.enterText("youssefahmed@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("youssef");
      await driver.tap(signInButton);
      await driver.waitFor(snackbar);
      assert(snackbar != null);
      await driver.waitUntilNoTransientCallbacks();
      assert(homepage == null);
    });

    test("logs in with correct email and password", () async {
      await driver.tap(emailField);
      await driver.enterText("youssefahmed@gmail.com");
      await driver.tap(passwordField);
      await driver.enterText("youssefahmed");
      await driver.tap(signInButton);
      await driver.waitFor(homepage);
      assert(homepage != null);
      await driver.waitUntilNoTransientCallbacks();
    });
  });
}
