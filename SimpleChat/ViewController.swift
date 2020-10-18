//
//  ViewController.swift
//  SimpleChat
//
//  Created by Asal 2 on 18/10/2020.
//  Copyright © 2020 Asal 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myChat = ChatMessages()
    
    override func viewDidLoad() {
          super.viewDidLoad()
          self.messages.dataSource = self
          self.messages.delegate = self
        self.messages.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        messages.separatorStyle = .none
        messages.showsVerticalScrollIndicator = false
          
      }

      @IBOutlet weak var messages: UITableView!
    
      @IBOutlet weak var textBox: UITextView!
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myChat.chatMessages.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myChat.chatMessages[indexPath.row]
        cell.layer.cornerRadius = cell.frame.height/2
           return cell
    }
    


    
    
    @IBAction func sendMessage(_ sender: Any) {
        var text = textBox.text
        if  text == nil {
            text = ""
            return
        }
        myChat.addText(text: text ?? "")
        textBox.text = ""
        messages.reloadData()
      }

    
}

