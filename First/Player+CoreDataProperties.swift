//
//  Player+CoreDataProperties.swift
//  First
//
//  Created by Junnosuke Kado on 2017/05/07.
//  Copyright © 2017年 JKadonosuke. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Player {

    @NSManaged var id: String?
    @NSManaged var pass: String?
    @NSManaged var title: String?
    @NSManaged var url: String?

}
