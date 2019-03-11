//
//  ProfileViewController.swift
//  Receiver
//
//  Created by Andrey Kyashkin on 3/9/19.
//  Copyright © 2019 Andrey. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray = [[ProfileData]]()
    let defaultSectionHeaderHeight: CGFloat = 35.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureData()
    }
    
    func configureData() {
        let firstSection: [ProfileData] = [
            ProfileData(title: "Name, Phone Numbers, Email"),
            ProfileData(title: "Password & Security"),
            ProfileData(title: "Payment & Shipping")
        ]
        dataArray.append(firstSection)
        
        let secondSection: [ProfileData] = [
            ProfileData(image: R.image.icoudIcon(), title: "iCloud"),
            ProfileData(image: R.image.appstoreIcon(), title: "iTunes & App Store"),
            ProfileData(image: R.image.familySharingIcon(), title: "Set Up Family Sharing...", visibleChevron: false, titleColor: UIColor(r: 23, g: 135, b: 247, a: 1.0))
        ]
        dataArray.append(secondSection)
    }

}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? ProfileHeaderView.defaultHeight : defaultSectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? ProfileHeaderView.instanceFromNib() : UIView()
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProfileTableViewCell.self)", for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        
        cell.profileData = dataArray[indexPath.section][indexPath.row]
        cell.isLastCell = indexPath.row == dataArray[indexPath.section].count
        
        return cell
    }
    
}
