//
//  CategoryListWorker.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import Foundation

class CategoryListWorker{

    typealias responseHandler = (_ response:CategoryList.Process.Response) ->()
    
    func hitMethodForGetList(type : String, success:@escaping(responseHandler), fail:@escaping(responseHandler))
        {
        //call network.
        
        let obj : CategoryAPIClient? = CategoryAPIClient()
        obj?.getContacts(completion: { (dataObj) in
            //Implement JSON decoding and parsing
            if dataObj != nil {
                do {
                    //Decode retrived data with JSONDecoder
                    let dataObj = try JSONDecoder().decode([CategoryListModel].self, from: dataObj!)
                    let resOnfo = CategoryList.Process.Response(success: true, msg: "Success", cat_list: dataObj)
                    success(resOnfo)
                } catch let jsonError {
                    print(jsonError)
                    let resOnfo = CategoryList.Process.Response(success: false, msg: jsonError.localizedDescription, cat_list: nil)
                    fail(resOnfo)
                }

            }else{
                let resOnfo = CategoryList.Process.Response(success: false, msg: "Error!! Unable to parse", cat_list: nil)
                fail(resOnfo)
            }
        })

    }
    

        
}
