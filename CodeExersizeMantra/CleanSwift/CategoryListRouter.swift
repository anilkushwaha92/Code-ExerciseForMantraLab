//
//  CategoryListRouter.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

protocol CategoryListRoutingLogic{
    func routeToVerifyScreen()
}

class CategoryListRouter: NSObject, CategoryListRoutingLogic{
    //weak var viewController: VC?
    func routeToVerifyScreen() {
       // viewController?.performPushSeguefromController(identifier: "testVC")
    }
}
