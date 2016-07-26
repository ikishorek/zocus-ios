//
//  LensesViewController+UITableViewDataSource.swift
//  Zocus
//
//  Created by Akram Hussein on 26/07/2016.
//  Copyright © 2016 Akram Hussein. All rights reserved.
//

import Foundation
import UIKit
import CocoaLumberjack

extension LensesViewController : UITableViewDataSource
{
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.LensCellIdentifier, forIndexPath: indexPath)
        let lens = self.lenses[indexPath.row]
        cell.textLabel?.text = "\(lens.name)"
        cell.textLabel?.textColor = .appGray()
        
        // Currently used lens?
        if (lens.currently_used)
        {            
            let image = UIImage(named: "CheckMark")
            let imageView = UIImageView(image: image)
            imageView.frame = CGRectMake(0, 0, 28.0, 28.0)
            cell.accessoryView = imageView
        }
        else
        {
            cell.accessoryView = nil
        }
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.lenses.count
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        let editAction = UITableViewRowAction(style: .Default, title: "AddLens.EditRowButton".localized, handler:{action, indexPath in
            let lens = self.lenses[indexPath.row]
            self.delegate?.lensEdited(self, lens: lens)
        })
        editAction.backgroundColor = .appGray()
        
        let deleteAction = UITableViewRowAction(style: .Destructive, title: "AddLens.DeleteRowButton".localized, handler:{ action, indexPath in
            let lens = self.lenses[indexPath.row]
            self.delegate?.lensDeleted(self, lens: lens)
        })
        
        return [deleteAction, editAction]
    }
}
