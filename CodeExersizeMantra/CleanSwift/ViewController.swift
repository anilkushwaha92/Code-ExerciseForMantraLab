//
//  ViewController.swift
//  CodeExersizeMantra
//
//  Created by Anil on 15/03/21.
//

import UIKit

protocol CategoryListVCLogic: class {
    func displayLogic(viewModel : CategoryList.Process.ViewModel)
}

class ViewController: UIViewController, CategoryListVCLogic{
    
    var catList : [CategoryListModel]?
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        methodForSetUpTableview(tableViewObj : tableView)
        methodForInteractWithJson()
    }

    func methodForSetUpTableview(tableViewObj : UITableView){
        tableViewObj.delegate = self
        tableViewObj.dataSource = self
        tableViewObj.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 70
        tableView.register(UINib(nibName: "CatListHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "CatListHeaderView")
        view.addSubview(tableViewObj)
        tableViewObj.frame = view.bounds
    }

    var interactor: CategoryListBusinessLogic?
    var router: CategoryListRoutingLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp(){
        
        let viewController = self
        let interactor = CategoryListInteractor()
        let router = CategoryListRouter()
        let presenter = CategoryListPresenter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        
    }
    
    func methodForInteractWithJson(){
        let request = CategoryList.Process.Request(type : "Json")
        interactor?.categoryList(request: request)
    }
    
    func displayLogic(viewModel: CategoryList.Process.ViewModel) {
        if !viewModel.success{
            tableView.isHidden = true
            tableView.reloadData()
            
        }else{
            tableView.isHidden = false
            catList = viewModel.cat_list
            tableView.reloadData()
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource, CatListHeaderViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let containerView = tableView.headerView(forSection: indexPath.section) as? CatListHeaderView else { return 0}
        
        if catList![indexPath.section].expanded == nil{
            DispatchQueue.main.async {
                containerView.CatlistCloseArrow()
            }
            return 0
        }else if catList![indexPath.section].expanded!{
            DispatchQueue.main.async {
                containerView.CatListOpenArrow()
            }
            return UITableView.automaticDimension
        } else {
            DispatchQueue.main.async {
                containerView.CatlistCloseArrow()
            }
            return 0
        }
    }
    
    func catListOpenAndCloseSection(header: CatListHeaderView, section: Int) {
        for theSection in 0..<catList!.count {
            if theSection == section {
                if catList?[theSection].expanded == nil{
                    catList![theSection].expanded = true
                }else{
                    catList![theSection].expanded = !(catList![section].expanded!)
                }
            } else {
                catList![theSection].expanded = false
            }
        }
        
        tableView.beginUpdates()
        for i in 0 ..< catList![section].sub_category!.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return catList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catList?[section].sub_category?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CatListHeaderView") as! CatListHeaderView
        
        header.common()
        header.delegate = self
        header.section = section
        header.catTitleLbl.text = "\(catList?[section].name ?? "")".capitalizingFirstLetter()
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell
        if catList != nil{
            cell?.displayContent(item : catList![indexPath.section].sub_category![indexPath.row])
        }
        
        if cell != nil{
            return cell!
        }
        return UITableViewCell()
    }
    
}

