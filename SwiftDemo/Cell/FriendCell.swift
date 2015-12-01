//
//  FriendCell.swift
//  SwiftDemo
//
//  Created by 郑文明 on 15/12/1.
//  Copyright © 2015年 郑文明. All rights reserved.
//

import UIKit

class FriendCell: UITableViewCell {

    @IBOutlet weak var avatarIV: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var desLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.avatarIV.clipsToBounds = true

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    
}
