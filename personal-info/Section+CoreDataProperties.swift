//
//  Section+CoreDataProperties.swift
//  
//
//  Created by Junnosuke Kado on 2018/06/11.
//
//

import Foundation
import CoreData


extension Section {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Section> {
        return NSFetchRequest<Section>(entityName: "Section")
    }

    @NSManaged public var sectionname: String?

}
