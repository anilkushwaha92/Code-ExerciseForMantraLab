//
//  CategoryListPresenter.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

protocol CategoryListPresentationLogic {
    func presentContactList(response: CategoryList.Process.Response)
}

class CategoryListPresenter: CategoryListPresentationLogic{
    
    weak var viewController : CategoryListVCLogic?
    func presentContactList(response:CategoryList.Process.Response) {
        let viewModel = CategoryList.Process.ViewModel(success: response.success, msg: response.msg, cat_list : response.cat_list)
        viewController?.displayLogic(viewModel: viewModel)
    }
}
