//
//  DiaryContentTVC.swift
//  DiaryApp
//
//  Created by Aniket Rao on 06/08/22.
//

import UIKit

class DiaryContentTVC: UITableViewCell {

    
    @IBOutlet weak var viewContent: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var txtViewContent: UITextView!
    @IBOutlet weak var lblTime: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }

    
    func setupUI(){
        txtViewContent.isEditable = false
        txtViewContent.textContainerInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        viewContent.layer.cornerRadius = 3
        viewContent.layer.shadowColor = UIColor.lightGray.cgColor
        viewContent.layer.shadowOpacity = 0.5
        viewContent.layer.shadowOffset = CGSize(width: .zero, height: 1.0)
        viewContent.layer.shadowRadius = 2.5
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
