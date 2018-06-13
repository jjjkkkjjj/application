//
//  Content+CoreDataProperties.swift
//  
//
//  Created by Junnosuke Kado on 2018/06/11.
//
//

import Foundation
import CoreData


extension Content {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Content> {
        return NSFetchRequest<Content>(entityName: "Content")
    }

    @NSManaged public var url: String?
    @NSManaged public var name: String?
    @NSManaged public var account: String?
    @NSManaged public var password: String?
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var address: String?
    @NSManaged public var tel: String?
    @NSManaged public var code: String?
    @NSManaged public var secret_q: String?
    @NSManaged public var secret_a: String?

}
