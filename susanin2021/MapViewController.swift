//
//  MapViewController.swift
//  susanin2021
//
//  Created by Scott_Mars on 14.01.2022.
//

import UIKit

class MapViewController: UIViewController {

    let viewPanel = UIView()
    var viewPanelHeightConstraint: NSLayoutConstraint?
    let titleView = UIView()
    let informationExcursionView = UIView()
    var isOpenPanel = false {
        didSet {
            informationExcursionView.isHidden = !isOpenPanel
            titleView.isHidden = isOpenPanel
            viewPanelHeightConstraint?.constant = isOpenPanel ? 440 : 160
            view.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        drawSelf()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapPanel))
        viewPanel.addGestureRecognizer(tap)
    }
    
    private func drawSelf() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let backgroundImageView = UIImageView(image: UIImage(named: "map"))
        view.addSubview(backgroundImageView)
        view.addSubview(viewPanel)
        
        viewPanel.backgroundColor = .white
        viewPanel.layer.cornerRadius = 20
        viewPanel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        viewPanel.clipsToBounds = true
        viewPanel.translatesAutoresizingMaskIntoConstraints = false
        
        let dash = UIView()
        dash.layer.cornerRadius = 3
        dash.translatesAutoresizingMaskIntoConstraints = false
        dash.backgroundColor = UIColor(named: "lightGray")
        
        viewPanel.addSubview(dash)
        
        let titleView = UIView()
        titleView.layer.cornerRadius = 12
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.backgroundColor = UIColor(named: "lightGray")
        
        viewPanel.addSubview(titleView)
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleView.addSubview(titleLabel)
        let defaultAttributes = [
            .font: UIFont.systemFont(ofSize: 14, weight: .regular),
            .foregroundColor: UIColor(named: "black")
        ] as [NSAttributedString.Key : Any]

        let marketingAttributes = [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold),
            .foregroundColor: UIColor(named: "black")
        ] as [NSAttributedString.Key : Any]
        
        let marketingBlueAttributes = [
            .font: UIFont.systemFont(ofSize: 14, weight: .bold),
            .foregroundColor: UIColor(named: "blue")
        ] as [NSAttributedString.Key : Any]

        let attributedStringComponents = [
            "В ",
            NSAttributedString(string: "Москве ",
                               attributes: marketingAttributes),
            NSAttributedString(string: "3 758 ",
                               attributes: marketingBlueAttributes),
            "экскурсий"
        ] as [AttributedStringComponent]
        titleLabel.attributedText = NSAttributedString(from: attributedStringComponents, defaultAttributes: defaultAttributes)
        titleLabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            viewPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            viewPanel.rightAnchor.constraint(equalTo: view.rightAnchor),
            viewPanel.leftAnchor.constraint(equalTo: view.leftAnchor),

            dash.centerXAnchor.constraint(equalTo: viewPanel.centerXAnchor),
            dash.topAnchor.constraint(equalTo: viewPanel.topAnchor, constant: 8),
            dash.widthAnchor.constraint(equalToConstant: 35),
            dash.heightAnchor.constraint(equalToConstant: 6),
            
            titleView.topAnchor.constraint(equalTo: dash.bottomAnchor, constant: 8),
            titleView.centerXAnchor.constraint(equalTo: viewPanel.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 4),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -4),
            titleLabel.leftAnchor.constraint(equalTo: titleView.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: titleView.rightAnchor, constant: -10),
        ])
        
        viewPanelHeightConstraint = viewPanel.heightAnchor.constraint(equalToConstant: 160)
        viewPanelHeightConstraint?.isActive = true
        
        informationExcursionView.translatesAutoresizingMaskIntoConstraints = false
        informationExcursionView.layer.cornerRadius = 7
        informationExcursionView.isHidden = true
        informationExcursionView.backgroundColor = .white
        informationExcursionView.clipsToBounds = true
        informationExcursionView.layer.masksToBounds = false
        informationExcursionView.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        informationExcursionView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        informationExcursionView.layer.shadowOpacity = 1
        informationExcursionView.layer.shadowRadius = 8
        
        let infoTopView = UIView()
        infoTopView.translatesAutoresizingMaskIntoConstraints = false
        
        let infoBottomView = UIView()
        infoBottomView.translatesAutoresizingMaskIntoConstraints = false
        
        let infoTopBackgroundImageView = UIImageView(image: UIImage(named: "icon_vdnh"))
        infoTopBackgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let raitingView = UIView()
        raitingView.translatesAutoresizingMaskIntoConstraints = false
        raitingView.layer.cornerRadius = 12
        raitingView.backgroundColor = .white
        
        let startImageView = UIImageView(image: UIImage(named: "icon_rating"))
        startImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let raitingLabel = UILabel()
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        raitingLabel.text = "4.1"
        raitingLabel.font = .systemFont(ofSize: 14, weight: .regular)
        raitingLabel.textColor = UIColor(named: "black")
        
        let priceView = UIView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
        priceView.backgroundColor = .white
        priceView.layer.cornerRadius = 12
        
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.text = "1000₽/чел"
        priceLabel.font = .systemFont(ofSize: 14, weight: .regular)
        priceLabel.textColor = UIColor(named: "black")
        
        let avatarOrgImageView = UIImageView(image: UIImage(named: "icon_user_vdnh"))
        avatarOrgImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let excursionTitle = UILabel()
        excursionTitle.translatesAutoresizingMaskIntoConstraints = false
        excursionTitle.text = "История ВДНХ"
        excursionTitle.font = .systemFont(ofSize: 18, weight: .medium)
        excursionTitle.textColor = UIColor(named: "black")
        
        let descriptionExcurtion = UILabel()
        descriptionExcurtion.translatesAutoresizingMaskIntoConstraints = false
        descriptionExcurtion.numberOfLines = 0
        let descriptionExcurtionDefaultAttributes = [
            .font: UIFont.systemFont(ofSize: 14, weight: .light),
            .foregroundColor: UIColor(named: "black")
        ] as [NSAttributedString.Key : Any]
        
        let descriptionExcurtionAttributedStringComponents = [
            "Краткое описание, которое будет давать общее представление об экскурсии. Обозначение ключевых мест маршрута, особенностей проведения и...",
            NSAttributedString(string: "читать далее",
                               attributes: marketingBlueAttributes)
        ] as [AttributedStringComponent]
        descriptionExcurtion.attributedText = NSAttributedString(from: descriptionExcurtionAttributedStringComponents, defaultAttributes: descriptionExcurtionDefaultAttributes)
        
        let tagsView = UIView()
        tagsView.translatesAutoresizingMaskIntoConstraints = false
        let countPeopleView = createTagView(icon: UIImage(named: "icon_placeholder_user"), text: "1-9", color: UIColor(named: "lightGray"))
        let timeView = createTagView(icon: UIImage(named: "icon_time"), text: "4 ч", color: UIColor(named: "lightGray"))
        let reviewView = createTagView(icon: UIImage(named: "icon_comment"), text: "57 отзывов", color: UIColor(named: "lightGray"))
        
        viewPanel.addSubview(informationExcursionView)
        informationExcursionView.addSubview(infoTopView)
        informationExcursionView.addSubview(infoBottomView)
        infoTopView.addSubview(infoTopBackgroundImageView)
        infoTopView.addSubview(raitingView)
        raitingView.addSubview(raitingLabel)
        raitingView.addSubview(startImageView)
        infoTopView.addSubview(priceView)
        priceView.addSubview(priceLabel)
        infoTopView.addSubview(avatarOrgImageView)
        infoBottomView.addSubview(excursionTitle)
        infoBottomView.addSubview(descriptionExcurtion)
        infoBottomView.addSubview(tagsView)
        tagsView.addSubview(countPeopleView)
        tagsView.addSubview(timeView)
        tagsView.addSubview(reviewView)
        
        NSLayoutConstraint.activate([
        
            informationExcursionView.topAnchor.constraint(equalTo: dash.bottomAnchor, constant: 8),
            informationExcursionView.leftAnchor.constraint(equalTo: viewPanel.leftAnchor, constant: 22),
            informationExcursionView.rightAnchor.constraint(equalTo: viewPanel.rightAnchor, constant: -22),
            
            informationExcursionView.heightAnchor.constraint(equalToConstant: 290),
            
            infoTopView.topAnchor.constraint(equalTo: informationExcursionView.topAnchor),
            infoTopView.leftAnchor.constraint(equalTo: informationExcursionView.leftAnchor),
            infoTopView.rightAnchor.constraint(equalTo: informationExcursionView.rightAnchor),
            
            infoBottomView.topAnchor.constraint(equalTo: infoTopView.bottomAnchor),
            infoBottomView.leftAnchor.constraint(equalTo: informationExcursionView.leftAnchor),
            infoBottomView.rightAnchor.constraint(equalTo: informationExcursionView.rightAnchor),
            infoBottomView.bottomAnchor.constraint(equalTo: informationExcursionView.bottomAnchor),
            
            raitingView.topAnchor.constraint(equalTo: infoTopView.topAnchor, constant: 15),
            raitingView.leftAnchor.constraint(equalTo: infoTopView.leftAnchor, constant: 15),
            raitingView.heightAnchor.constraint(equalToConstant: 24),
            
            startImageView.leftAnchor.constraint(equalTo: raitingView.leftAnchor, constant: 10),
            startImageView.centerYAnchor.constraint(equalTo: raitingView.centerYAnchor),
            
            raitingLabel.rightAnchor.constraint(equalTo: raitingView.rightAnchor, constant: -10),
            raitingLabel.centerYAnchor.constraint(equalTo: raitingView.centerYAnchor),
            raitingLabel.leftAnchor.constraint(equalTo: startImageView.rightAnchor, constant: 5),
            
            priceView.topAnchor.constraint(equalTo: infoTopView.topAnchor, constant: 15),
            priceView.rightAnchor.constraint(equalTo: infoTopView.rightAnchor, constant: -15),
            priceView.heightAnchor.constraint(equalToConstant: 24),
            
            priceLabel.rightAnchor.constraint(equalTo: priceView.rightAnchor, constant: -10),
            priceLabel.centerYAnchor.constraint(equalTo: priceView.centerYAnchor),
            priceLabel.leftAnchor.constraint(equalTo: priceView.leftAnchor, constant: 10),
            
            infoTopBackgroundImageView.topAnchor.constraint(equalTo: infoTopView.topAnchor),
            infoTopBackgroundImageView.bottomAnchor.constraint(equalTo: infoTopView.bottomAnchor),
            infoTopBackgroundImageView.leftAnchor.constraint(equalTo: infoTopView.leftAnchor),
            infoTopBackgroundImageView.rightAnchor.constraint(equalTo: infoTopView.rightAnchor),
            infoTopBackgroundImageView.heightAnchor.constraint(equalToConstant: 137),
            
            
            avatarOrgImageView.leftAnchor.constraint(equalTo: infoTopView.leftAnchor, constant: 15),
            avatarOrgImageView.bottomAnchor.constraint(equalTo: infoTopView.bottomAnchor, constant: -15),
            
            excursionTitle.leftAnchor.constraint(equalTo: infoBottomView.leftAnchor, constant: 15),
            excursionTitle.rightAnchor.constraint(equalTo: infoBottomView.rightAnchor, constant: -15),
            excursionTitle.topAnchor.constraint(equalTo: infoBottomView.topAnchor, constant: 10),
            
            descriptionExcurtion.leftAnchor.constraint(equalTo: infoBottomView.leftAnchor, constant: 15),
            descriptionExcurtion.rightAnchor.constraint(equalTo: infoBottomView.rightAnchor, constant: -15),
            descriptionExcurtion.topAnchor.constraint(equalTo: excursionTitle.bottomAnchor, constant: 5),
            
            
            tagsView.leftAnchor.constraint(equalTo: infoBottomView.leftAnchor, constant: 15),
            tagsView.rightAnchor.constraint(equalTo: infoBottomView.rightAnchor, constant: -15),
            tagsView.bottomAnchor.constraint(equalTo: infoBottomView.bottomAnchor, constant: -15),
            tagsView.heightAnchor.constraint(equalToConstant: 24),

            countPeopleView.leftAnchor.constraint(equalTo: tagsView.leftAnchor),
            countPeopleView.heightAnchor.constraint(equalToConstant: 24),
            countPeopleView.centerYAnchor.constraint(equalTo: tagsView.centerYAnchor),
            
            timeView.leftAnchor.constraint(equalTo: countPeopleView.rightAnchor,constant: 5),
            timeView.heightAnchor.constraint(equalToConstant: 24),
            timeView.centerYAnchor.constraint(equalTo: tagsView.centerYAnchor),
            
            reviewView.leftAnchor.constraint(equalTo: timeView.rightAnchor, constant: 5),
            reviewView.heightAnchor.constraint(equalToConstant: 24),
            reviewView.centerYAnchor.constraint(equalTo: tagsView.centerYAnchor)
        ])
    }
    
    private func createTagView(icon: UIImage?, text: String, color: UIColor?) -> UIView {
        let tagView = UIView()
        tagView.translatesAutoresizingMaskIntoConstraints = false
        tagView.layer.cornerRadius = 12
        tagView.backgroundColor = color
        
        let imageView = UIImageView(image: icon)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = text
        textLabel.font = .systemFont(ofSize: 14, weight: .regular)
        textLabel.textColor = UIColor(named: "black")
        
        tagView.addSubview(imageView)
        tagView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            
            imageView.leftAnchor.constraint(equalTo: tagView.leftAnchor, constant: 10),
            imageView.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
            
            textLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 5),
            textLabel.rightAnchor.constraint(equalTo: tagView.rightAnchor, constant: -10),
            textLabel.centerYAnchor.constraint(equalTo: tagView.centerYAnchor),
        ])
        
        return tagView
    }
    
    @objc private func onTapPanel() {
        isOpenPanel = !isOpenPanel
    }
}

