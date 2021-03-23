//
//  CategoryListInteractor.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

protocol CategoryListBusinessLogic {
    func categoryList(request: CategoryList.Process.Request)
}
class CategoryListInteractor: CategoryListBusinessLogic{
    var worker = CategoryListWorker()
    var presenter : CategoryListPresenter?
    func categoryList(request: CategoryList.Process.Request) {
        worker.hitMethodForGetList(type : request.type ?? "Json") { (obj) in
            
            self.presenter?.presentContactList(response: obj)
            
        } fail: { (message) in
            
            self.presenter?.presentContactList(response: CategoryList.Process.Response(success: false))
        }

    }
}
