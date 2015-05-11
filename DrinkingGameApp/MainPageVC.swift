//
//  MainPageVC.swift
//  DrinkingGameApp
//
//  Created by Peter & Liz  on 4/25/15.
//  Copyright (c) 2015 P&L Studios. All rights reserved.
//

import UIKit

class MainPageVC: UITableViewController, UISearchResultsUpdating {
    
    @IBAction func searchButton(sender: AnyObject) {
          self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            controller.searchBar.tintColor = UIColor.whiteColor()
            controller.searchBar.barTintColor = UIColor.whiteColor()
            controller.searchBar.placeholder = "Search DeluxeDruk"
            return controller
            })()
        // Reload the table
        self.tableView.reloadData()
    }
    
    let tableData = ["Cirkel","Over/Under","Pyramide","Vandfald","Det Tomme Glas","Meyer","Snyd","Terningspillet","Træmand","100","711","Beerpong","Gris","Øl Bowling","Øl Kroket","Øl Pentanque","Dude Where's My Car","Friends","Home Alone","James Bond","Lord Of The Rings","Buffalo","Fifa Druk","Flip The Cup","Gryde","Jeg Har Aldrig","Kapsel","Kævle","Quarters","Stopur","Søm","Tid","Øl Dart","Øl Stafet"]
    
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    var mainImages = [String]()
    var mainNames = [String]()
    var mainArrow = [String]()
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            println("Kortspil")
            self.performSegueWithIdentifier("kortspil", sender: self)
        }
        else if indexPath.row == 1
        {
            println("Terningspil")
            self.performSegueWithIdentifier("terningspil", sender: self)
        }
        else if indexPath.row == 2
        {
            println("Boldspil")
            self.performSegueWithIdentifier("boldspil", sender: self)
        }
        else if indexPath.row == 3
        {
            println("Film")
            self.performSegueWithIdentifier("film", sender: self)
        }
        else if indexPath.row == 4
        {
            println("Andet")
            self.performSegueWithIdentifier("andet", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainNames = ["Kortspil",
            "Terningspil",
            "Boldspil",
            "Film",
            "Andet"]
        
        mainImages = ["icon1.png",
            "icon2.png",
            "icon3.png",
            "icon4.png",
            "icon5.png"]
        
        mainArrow = ["img5.png",
            "img5.png",
            "img5.png",
            "img5.png",
            "img5.png"]
        
        tableView.estimatedRowHeight = 50
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return self.filteredTableData.count
        } else {
        return mainNames.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =
        self.tableView.dequeueReusableCellWithIdentifier(
            "maincell", forIndexPath: indexPath)
            as! MainPageCell
        
        if (self.resultSearchController.active) {
            cell.mainLabel?.text = filteredTableData[indexPath.row]
            return cell
        } else {
        let row = indexPath.row
        cell.mainLabel.text = mainNames[row]
        cell.mainImage.image = UIImage(named: mainImages[row])
        cell.mainArrow.image = UIImage(named: mainArrow[row])

        return cell
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Default
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "logo123.png")
            imageView.image = image
            navigationItem.titleView = imageView
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    

    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text)
        let array = (tableData as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
    }

}
