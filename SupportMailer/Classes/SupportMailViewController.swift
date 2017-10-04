//
//  SupportMailViewController.swift
//
//  Created by Michael Fellows on 10/3/17.
//  Copyright © 2017 Broadway Lab, Inc. All rights reserved.
//

import MessageUI
import CoreTelephony

class SupportMailController: MFMailComposeViewController {

    /**
     * @param toRecipients Array of email addresses to send the email to.
     * @param subject The subject line for the email
     * @param body The body for the email
     */
    required init(toRecipients: [String], subject: String, body: String) {
        super.init(nibName: nil, bundle: nil)
        self.setToRecipients(toRecipients)
        self.setSubject(subject)
        self.setMessageBody(appended(body: body), isHTML: false)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SupportMailController {
    /*
     * Appends device information to the email body.
     *
     * @param body The support email.
     * @return Full email body.
     */
    fileprivate func appended(body: String) -> String {
        var body = body
        let device = SupportMailController.Device()
        body.append(device.deviceDescription())
        return body
    }
}

extension SupportMailController {
    class Device {

        var osVersion: String {
            get {
                return UIDevice.current.systemVersion
            }
        }

        var appVersion: String {
            get {
                let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                    ?? ""
                let build = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as? String ?? ""
                return version + " (\(build))"
            }
        }

        var deviceModel: String {
            get {
                return UIDevice.current.modelName
            }
        }

        var language: String {
            get {
                return NSLocale.preferredLanguages.first ?? ""
            }
        }

        var carrierName: String {
            get {
                let info = CTTelephonyNetworkInfo()
                guard let carrier = info.subscriberCellularProvider else { return "" }
                return carrier.carrierName ?? ""
            }
        }

        func deviceDescription() -> String {
            return "\n\n\n\n---Device Info---" +
                "\nOS Version: \(osVersion)" +
                "\nApp Version: \(appVersion)" +
                "\nDevice Model: \(deviceModel)" +
                "\nLanguage: \(language)" +
            "\nCarrier: \(carrierName)"
        }
    }
}

fileprivate extension UIDevice {
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }
}


