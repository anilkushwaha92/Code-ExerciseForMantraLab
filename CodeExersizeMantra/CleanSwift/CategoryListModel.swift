//
//  CategoryListModel.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

enum CategoryList{
    enum Process {
        struct Request {
            var type : String?
        }
        
        struct Response {
            var success : Bool
            var msg : String?
            var cat_list : [CategoryListModel]?
        }
        struct ViewModel {
            var success : Bool
            var msg : String?
            var cat_list : [CategoryListModel]?
        }
    }
}

struct CategoryListModel : Codable {
    let name : String?
    var expanded : Bool?
    let sub_category : [sub_category]?
}

struct sub_category : Codable {
    let name : String?
    let display_name : String?
}
