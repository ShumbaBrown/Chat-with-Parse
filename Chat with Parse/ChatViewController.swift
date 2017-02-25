//
//  ChatViewController.swift
//  Chat with Parse
//
//  Created by Shumba Brown on 2/23/17.
//  Copyright © 2017 Shumba Brown. All rights reserved.
//

import UIKit
import Parse

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    
    var message: String?
    var messages: [String?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.chatTableView.delegate = self
        self.chatTableView.dataSource = self
        
        self.chatTableView.estimatedRowHeight = 46
        self.chatTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: "reload", userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSendButton(_ sender: Any) {
        message = messageTextField.text
        let messageSend = PFObject(className: "Message")
        messageSend["text"] = message!
        messageSend["user"] = PFUser.current()
        
        messageSend.saveInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                print(messageSend["text"])
            }
        }
        
        messageTextField.text = ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.populateCell(message: messages[indexPath.row]!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return messages.count
    }
    
    func reload() {
        print("reload")
        var query = PFQuery(className:"Message")
        
        query.whereKeyExists("text")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                if let objects = objects {
                    self.messages = []
                    for object in objects {
                        print(object["text"])
                        
                        self.messages.append(object["text"] as! String?)
                        
                    }
                }
            }
        }
        chatTableView.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
