//
//  ProfileViewController.swift
//  susanin2021
//
//  Created by Scott_Mars on 14.01.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        drawSelf()
    }
    
    private func drawSelf() {
        
        //view.translatesAutoresizingMaskIntoConstraints = false
        let userPanelView = UIView()
        userPanelView.translatesAutoresizingMaskIntoConstraints = false
        let avatarView = UIView()
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        let avatarImageView = UIImageView(image: UIImage(named: "icon_avatar"))
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        let photoImageView = UIImageView(image: UIImage(named: "icon_camera"))
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let fioLabel = UILabel()
        fioLabel.translatesAutoresizingMaskIntoConstraints = false
        fioLabel.text = "Владислав\nВолков"
        fioLabel.numberOfLines = 2
        fioLabel.font = .systemFont(ofSize: 18, weight: .medium)
        fioLabel.textColor = UIColor(named: "black")
        
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "профиль туриста"
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = UIColor(named: "gray")
        
        let logoutButton = UIButton()
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setImage(UIImage(named: "icon_logout"), for: .normal)
        
        view.addSubview(userPanelView)
        userPanelView.addSubview(avatarView)
        avatarView.addSubview(avatarImageView)
        avatarView.addSubview(photoImageView)
        
        userPanelView.addSubview(fioLabel)
        userPanelView.addSubview(descriptionLabel)
        userPanelView.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            userPanelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            userPanelView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22),
            userPanelView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -22),
            
            avatarView.topAnchor.constraint(equalTo: userPanelView.topAnchor),
            avatarView.leftAnchor.constraint(equalTo: userPanelView.leftAnchor),
            avatarView.bottomAnchor.constraint(equalTo: userPanelView.bottomAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 76),
            avatarView.heightAnchor.constraint(equalToConstant: 76),
            
            avatarImageView.topAnchor.constraint(equalTo: avatarView.topAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: avatarView.leftAnchor),
            avatarImageView.rightAnchor.constraint(equalTo: avatarView.rightAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            
            photoImageView.rightAnchor.constraint(equalTo: avatarView.rightAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: avatarView.bottomAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 24),
            photoImageView.heightAnchor.constraint(equalToConstant: 24),
            
            fioLabel.topAnchor.constraint(equalTo: userPanelView.topAnchor, constant: 5),
            fioLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 15),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: userPanelView.bottomAnchor, constant: -5),
            descriptionLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 15),
            
            logoutButton.topAnchor.constraint(equalTo: userPanelView.topAnchor, constant: 7),
            logoutButton.rightAnchor.constraint(equalTo: userPanelView.rightAnchor),
        ])
        
        
        let editUserView = UIView()
        editUserView.translatesAutoresizingMaskIntoConstraints = false
        let editUserImageView = UIImageView(image: UIImage(named: "icon_edit"))
        editUserImageView.translatesAutoresizingMaskIntoConstraints = false
        let editUserTitle = UILabel()
        editUserTitle.translatesAutoresizingMaskIntoConstraints = false
        editUserTitle.text = "Редактировать личные данные"
        editUserTitle.font = .systemFont(ofSize: 16, weight: .regular)
        editUserTitle.textColor = UIColor(named: "black")
        
        let settingProfileView = UIView()
        settingProfileView.translatesAutoresizingMaskIntoConstraints = false
        let settingProfileImageView = UIImageView(image: UIImage(named: "icon_setting"))
        settingProfileImageView.translatesAutoresizingMaskIntoConstraints = false
        let settingProfileTitle = UILabel()
        settingProfileTitle.translatesAutoresizingMaskIntoConstraints = false
        settingProfileTitle.text = "Настройки профиля"
        settingProfileTitle.font = .systemFont(ofSize: 16, weight: .regular)
        settingProfileTitle.textColor = UIColor(named: "black")
        
        view.addSubview(editUserView)
        editUserView.addSubview(editUserImageView)
        editUserView.addSubview(editUserTitle)
        view.addSubview(settingProfileView)
        settingProfileView.addSubview(settingProfileImageView)
        settingProfileView.addSubview(settingProfileTitle)
        
        NSLayoutConstraint.activate([
        
            editUserView.topAnchor.constraint(equalTo: userPanelView.bottomAnchor, constant: 35),
            editUserView.leftAnchor.constraint(equalTo: userPanelView.leftAnchor),
            
            settingProfileView.topAnchor.constraint(equalTo: editUserView.bottomAnchor, constant: 25),
            settingProfileView.leftAnchor.constraint(equalTo: userPanelView.leftAnchor),
            
            
            editUserImageView.leftAnchor.constraint(equalTo: editUserView.leftAnchor),
            editUserImageView.bottomAnchor.constraint(equalTo: editUserView.bottomAnchor),
            editUserImageView.topAnchor.constraint(equalTo: editUserView.topAnchor),
            
            editUserTitle.leftAnchor.constraint(equalTo: editUserImageView.rightAnchor, constant: 10),
            editUserTitle.rightAnchor.constraint(equalTo: editUserView.rightAnchor),
            
            settingProfileImageView.leftAnchor.constraint(equalTo: settingProfileView.leftAnchor),
            settingProfileImageView.bottomAnchor.constraint(equalTo: settingProfileView.bottomAnchor),
            settingProfileImageView.topAnchor.constraint(equalTo: settingProfileView.topAnchor),
            
            settingProfileTitle.leftAnchor.constraint(equalTo: settingProfileImageView.rightAnchor, constant: 10),
            settingProfileTitle.rightAnchor.constraint(equalTo: settingProfileView.rightAnchor),
        ])
        
    }

}
