//
//  ViewController.swift
//  SendLater
//
//  Created by Daniel Olshansky on 1/17/16.
//  Copyright © 2016 olshansky. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var messageView: UITextView?
    @IBOutlet weak var toField: UITextField?
    @IBOutlet weak var sendButton: UIButton?
    
    let dateFormatter = NSDateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat="EEEE, MMMM dd, yyyy' at 'h:mm a"
        messageView?.layer.borderColor = UIColor.blackColor().CGColor
        messageView?.layer.borderWidth = 1.0
        messageView?.editable = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendMessage(sender: UIButton) {
        let parameters: [String: String] = [
            "message": (messageView?.text)!,
            "recipient": (toField?.text)!,
            "sender:": "me?",
            "when": dateFormatter.stringFromDate((datePicker?.date)!)
        ]
        Alamofire.request(.POST, "davidbieber.com/sendlater/message", parameters: parameters)
            .responseData { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
        }
    }
}

