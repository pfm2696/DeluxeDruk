//
//  FilmVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class FilmVC: UITableViewController {
    
    @IBAction func backButton(sender: AnyObject) {
        self.performSegueWithIdentifier("filmback", sender: self)
    }
    var films = [Film]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sample Data for Array
        
        self.films = [Film(category:"Film", name:"Dude Where's My Car"),
            Film(category:"Film", name:"Friends"),
            Film(category:"Film", name:"Home Alone"),
            Film(category:"Film", name:"James Bond"),
            Film(category:"Film", name:"Lord Of The Rings")]
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            self.performSegueWithIdentifier("dude", sender: self)
        }
        else if indexPath.row == 1
        {
            self.performSegueWithIdentifier("friends", sender: self)
        }
        else if indexPath.row == 2
        {
            self.performSegueWithIdentifier("home", sender: self)
        }
        else if indexPath.row == 3
        {
            self.performSegueWithIdentifier("james", sender: self)
        }
        else if indexPath.row == 4
        {
            self.performSegueWithIdentifier("lord", sender: self)
        }
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.films.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("filmcell", forIndexPath: indexPath) as! UITableViewCell
        
        // Get the corresponding terningspil from our terningspils array
        let film = self.films[indexPath.row]
        
        // Configure the cell
        cell.textLabel!.text = film.name
        cell.userInteractionEnabled = true;
        cell.textLabel!.enabled = true;
        
        let imageView = UIImageView(frame: CGRectMake(10, 10, 30, 30))
        var image = UIImage(named: "img5.png");
        imageView.image = image;
        
        let checkmark = (imageView);
        cell.accessoryView = checkmark
        
        return cell

    }
}
