import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    print("Google Maps API key loading...")
     // Load the API key from GoogleMapsAPIKey.plist
    if let path = Bundle.main.path(forResource: "GoogleMapsAPIKey", ofType: "plist"),
       let config = NSDictionary(contentsOfFile: path),
       let apiKey = config["GoogleMapsAPIKey"] as? String {

      GMSServices.setMetalRendererEnabled(false)
      GMSServices.provideAPIKey(apiKey)
      print("Google Maps API key loaded successfully")
    } else {
      // Handle the error if the config file or API key is missing
      print("Error: GoogleMapsAPIKey.plist file or GoogleMapsAPIKey is missing")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

