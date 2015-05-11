//
//  KortspilVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class KortspilVC: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("kortspilback", sender: self)
    }
    var kortspils = [Kortspil]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Data for Array
        
        self.kortspils = [Kortspil(category:"Kortspil", name:"Cirkel"),
            Kortspil(category:"Kortspil", name:"Over/Under"),
            Kortspil(category:"Kortspil", name:"Pyramide"),
            Kortspil(category:"Kortspil", name:"Vandfald")]
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.performSegueWithIdentifier("cirkel", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegueWithIdentifier("over/under", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegueWithIdentifier("pyramide", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegueWithIdentifier("vandfald", sender: self)
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.kortspils.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("kortspilcell", forIndexPath: indexPath) as! UITableViewCell
        
        // Get the corresponding candy from our candies array
        let kortspil = self.kortspils[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = kortspil.name

        let imageView = UIImageView(frame: CGRectMake(10, 10, 30, 30))
        var image = UIImage(named: "img5.png");
        imageView.image = image;

        let checkmark = (imageView);
         cell.accessoryView = checkmark
        
        return cell
    }
}
