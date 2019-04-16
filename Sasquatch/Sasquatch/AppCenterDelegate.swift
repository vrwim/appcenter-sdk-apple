// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License.

#if !ACTIVE_COMPILATION_CONDITION_PUPPET
import AppCenter
import AppCenterAnalytics
import AppCenterDataStorage
#endif

class TestDocument : NSObject, MSSerializableDocument {
  var key: String = ""
  required init(from dictionary: [AnyHashable : Any]) {
    if let value = dictionary["key"] {
      self.key = "\(value)";
    }
  }
  func serializeToDictionary() -> [AnyHashable : Any] {
    return ["key" : key];
  }
}

/**
 * Protocol for interacting with AppCenter SDK.
 * Swift and Objective C implement this protocol
 * to show usage of AppCenter SDK in a language specific way.
 */
@objc protocol AppCenterDelegate {

  // MSAppCenter section.
  func isAppCenterEnabled() -> Bool
  func setAppCenterEnabled(_ isEnabled: Bool)
  func setCustomProperties(_ customProperties: MSCustomProperties)
  func installId() -> String
  func appSecret() -> String
  func sdkVersion() -> String
  func isDebuggerAttached() -> Bool
  func startAnalyticsFromLibrary()
  func setUserId(_ userId: String?)
  func setLogUrl(_ logUrl: String?)
  func setCountryCode(_ countryCode: String?)
  
  // Modules section.
  func isAnalyticsEnabled() -> Bool
  func isCrashesEnabled() -> Bool
  func isDistributeEnabled() -> Bool
  func isIdentityEnabled() -> Bool
  func isPushEnabled() -> Bool
  func setAnalyticsEnabled(_ isEnabled: Bool)
  func setCrashesEnabled(_ isEnabled: Bool)
  func setDistributeEnabled(_ isEnabled: Bool)
  func setIdentityEnabled(_ isEnabled: Bool)
  func setPushEnabled(_ isEnabled: Bool)

  // MSAnalytics section.
  func trackEvent(_ eventName: String)
  func trackEvent(_ eventName: String, withProperties: Dictionary<String, String>)
  func trackEvent(_ eventName: String, withProperties: Dictionary<String, String>, flags: MSFlags)
  func trackEvent(_ eventName: String, withTypedProperties: MSEventProperties)
  func trackEvent(_ eventName: String, withTypedProperties: MSEventProperties?, flags: MSFlags)
  func trackPage(_ pageName: String)
  func trackPage(_ pageName: String, withProperties: Dictionary<String, String>)
  func resume()
  func pause()
  
  // MSCrashes section.
  func hasCrashedInLastSession() -> Bool
  func generateTestCrash()
  
  // MSDistribute section.
  func showConfirmationAlert()
  func showDistributeDisabledAlert()
  func showCustomConfirmationAlert()

  // MSIdentity section.
  func signIn()
  func signOut()
  
  // Last crash report section.
  func lastCrashReportIncidentIdentifier() -> String?
  func lastCrashReportReporterKey() -> String?
  func lastCrashReportSignal() -> String?
  func lastCrashReportExceptionName() -> String?
  func lastCrashReportExceptionReason() -> String?
  func lastCrashReportAppStartTimeDescription() -> String?
  func lastCrashReportAppErrorTimeDescription() -> String?
  func lastCrashReportAppProcessIdentifier() -> UInt
  func lastCrashReportIsAppKill() -> Bool
  func lastCrashReportDeviceModel() -> String?
  func lastCrashReportDeviceOemName() -> String?
  func lastCrashReportDeviceOsName() -> String?
  func lastCrashReportDeviceOsVersion() -> String?
  func lastCrashReportDeviceOsBuild() -> String?
  func lastCrashReportDeviceLocale() -> String?
  func lastCrashReportDeviceTimeZoneOffset() -> NSNumber?
  func lastCrashReportDeviceScreenSize() -> String?
  func lastCrashReportDeviceAppVersion() -> String?
  func lastCrashReportDeviceAppBuild() -> String?
  func lastCrashReportDeviceCarrierName() -> String?
  func lastCrashReportDeviceCarrierCountry() -> String?
  func lastCrashReportDeviceAppNamespace() -> String?
  
  // MSStorage section
  func listDocumentsWithPartition(_ partitionName: String, documentType: AnyClass, completionHandler: @escaping (_ paginatedDocuments:MSPaginatedDocuments<TestDocument>) -> Void)
  func createDocumentWithPartition(_ partitionName: String, documentId: String, document: TestDocument, writeOptions: MSWriteOptions)
  func replaceDocumentWithPartition(_ partitionName: String, documentId: String, document: TestDocument)
  func deleteDocumentWithPartition(_ partitionName: String, documentId: String)
}
