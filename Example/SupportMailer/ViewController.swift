//
//  ViewController.swift
//  SupportMailer
//
//  Created by Michael Fellows on 10/04/2017.
//  Copyright (c) 2017 Michael Fellows. All rights reserved.
//

import UIKit
import MessageUI
import SupportMailer

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func supportMailerButtonPressed(_ sender: Any) {
        let recipients = ["michael+supportmailer@broadwaylab.com"]
        let subject = "SupportMailer: Customer Support"
        let body = "What's your question?"
        let supportMailer = SupportMailController(toRecipients: recipients,
                                                  subject: subject,
                                                  body: body)
        supportMailer.mailComposeDelegate = self
        present(supportMailer, animated: true, completion: nil)
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

