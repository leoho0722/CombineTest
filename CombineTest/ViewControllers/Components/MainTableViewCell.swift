//
//  MainTableViewCell.swift
//  CombineTest
//
//  Created by Leo Ho on 2023/3/6.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var lbMessage: UILabel!
    
    // MARK: - Variables
    
    static let identifier = "MainTableViewCell"
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI Settings
    
    func setInit(message: String) {
        lbMessage.text = message
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extensions



// MARK: - Protocol


