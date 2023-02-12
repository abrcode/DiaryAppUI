//
//  DiaryVC.swift
//  DiaryApp
//
//  Created by Aniket Rao on 06/08/22.
//

import UIKit

class DiaryVC: UIViewController {
 
    
    // MARK: - Properties
    let urlSession = URLSessionFile.shared
    let myContent: [[String]] = [["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."], ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. "] , ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."] , ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Et felis amet enim faucibus ornare nisl euismod.Lorem ipsum dolor sit amet, consectetur adipiscing elit. "]]

    let myTitles: [String] = ["Today", "Yesterday" , "Apr" , "Feb"]
    
    
    // MARK: - IBOutlets
    @IBOutlet weak var tblDiary: UITableView!
    
    
    
    // MARK: - Life cycle
    
    
    
    
    // MARK: - Set up
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    func setupUI(){
        tblDiary.delegate = self
        tblDiary.dataSource = self
        tblDiary.register(UINib(nibName: "TableHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "TableHeaderView")
        tblDiary.register(UINib(nibName: "DiaryContentTVC", bundle: nil), forCellReuseIdentifier: "DiaryContentTVC")
        
    }
    
    func setupNavigationBar(){
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "My Diary"
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
}

// MARK: -  UITable View Delegate and Datasource
extension DiaryVC : UITableViewDelegate , UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {

    return myContent.count

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    return myContent[section].count

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TableHeaderView") as! TableHeaderView
    headerView.lblPostTime.text = myTitles[section]
    return headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let myCell = tableView.dequeueReusableCell(withIdentifier: "DiaryContentTVC", for: indexPath) as? DiaryContentTVC
        myCell?.selectionStyle = .none
        myCell?.txtViewContent?.text = myContent[indexPath.section][indexPath.row]
        
        DispatchQueue.main.async {
            self.adjustUITextViewHeight(arg: myCell?.txtViewContent ?? UITextView())
        }
        return myCell ?? UITableViewCell()

    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
