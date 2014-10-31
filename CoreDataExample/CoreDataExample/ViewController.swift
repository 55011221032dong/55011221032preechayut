//
//  ViewController.swift
//  CoreDataExample
//
//  Created by student on 10/31/14.
//  Copyright (c) 2014 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "New item", message: "Add a item", preferredStyle: .Alert)
        let saveAction = UIAlertAction(title: "Save", style: .Default){
            (action:UIAlertAction!) -> Void in
            let textField = alert.textFields![0] as UITextField
            self.item.append(textField.text )
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "calcel", style: .Default){(action: UIAlertAction!) -> Void in
        }
        alert.addTextFieldWithConfigurationHandler{(textField: UITextField!) -> Void in
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert,animated: true,completion: nil)
        
    }
    
    
    var item = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"Shopping list\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) ->Int{
        return item.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        cell.textLabel?.text = item[indexPath.row]
        return cell
    }
    
  
    
    

}

