//
//  DetailViewController.swift
//  8homework3m
//
//  Created by mavluda on 1/4/23.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    var image = ""
    var number = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }


    private func initUI(){
        
        view.backgroundColor = .white
        let mainImage: UIImageView = {
            let view = UIImageView(image: UIImage(systemName: image))
            view.layer.cornerRadius = 50
            view.contentMode = .scaleAspectFill
            view.clipsToBounds = true
            return view
        }()
        
        let nameLabel: UILabel = {
            let view = UILabel()
            view.text = name
            view.font  = .systemFont(ofSize: 24, weight: .medium)
            return view
        }()
        
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(100)
            make.height.width.equalTo(100)
        }
        
        view.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainImage.snp.bottom).offset(8)
        }
        
        
        let messageView = createView(title: "Message", image: "ellipsis.message.fill", textColor: .systemBlue, backgroundColor: .systemBlue, imageTintColor: .white)
        let callView = createView(title: "Call", image: "phone.fill", textColor: .systemBlue, backgroundColor: .systemBlue, imageTintColor: .white)
        let faceTimeView = createView(title: "FaceTime", image: "video.fill", textColor: .systemBlue, backgroundColor: .systemBlue, imageTintColor: .white)
        let mailView = createView(title: "Mail", image: "envelope.fill", textColor: .lightGray, backgroundColor: .systemGray6, imageTintColor: .lightGray)
        
        view.addSubview(callView)
        callView.snp.makeConstraints { make in
            make.right.equalTo(view.snp.centerX).offset(-8)
            make.width.equalTo(60)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(faceTimeView)
        faceTimeView.snp.makeConstraints { make in
            make.left.equalTo(callView.snp.right).offset(10)
            make.width.height.equalTo(60)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(mailView)
        mailView.snp.makeConstraints { make in
            make.left.equalTo(faceTimeView.snp.right).offset(10)
            make.width.height.equalTo(60)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        view.addSubview(messageView)
        messageView.snp.makeConstraints { make in
            make.right.equalTo(callView.snp.left).offset(-10)
            make.width.height.equalTo(60)
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
        
        let containerView = UIView()
        view.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.equalTo(mailView.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(83)
            make.leading.trailing.equalToSuperview()
        }
        
        //444 (70 * 5) + 94
        
        let mobileView = UIView()
        containerView.addSubview(mobileView)
        mobileView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(94)
        }
        
        let mobileLabel = UILabel()
        mobileLabel.text = "Mobile"
        mobileLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        let numberLabel = UILabel()
        numberLabel.text = number
        numberLabel.textColor = .systemBlue
        numberLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        
        mobileView.addSubview(mobileLabel)
        mobileLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(20)
        }
        mobileView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(mobileLabel.snp.bottom).offset(12)
            make.left.equalTo(mobileLabel)
        }
        
        let faceTime2View = UIView()
        faceTime2View.backgroundColor = .systemGray6
        containerView.addSubview(faceTime2View)
        faceTime2View.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(mobileView.snp.bottom)
            make.height.equalTo(70)
        }
        
        let faceTimeLabel = UILabel()
        faceTimeLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        faceTimeLabel.text = "FaceTime"
        faceTime2View.addSubview(faceTimeLabel)
        faceTimeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
        
        let faceTimeIcon = createView(title: "", image: "video.fill", textColor: .clear, backgroundColor: .systemGray5, imageTintColor: .systemBlue)
        let callIcon = createView(title: "", image: "phone.fill", textColor: .clear, backgroundColor: .systemGray5, imageTintColor: .systemBlue)
        
        faceTime2View.addSubview(callIcon)
        callIcon.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(50)
            make.centerY.equalTo(faceTimeLabel.snp.top)
            make.height.width.equalTo(20)
        }
        
        faceTime2View.addSubview(faceTimeIcon)
        faceTimeIcon.snp.makeConstraints { make in
            make.right.equalTo(callIcon.snp.left).offset(-50)
            make.centerY.equalTo(faceTimeLabel.snp.top)
            make.height.width.equalTo(20)
        }
        
        let notesView = UIView()
        containerView.addSubview(notesView)
        notesView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(faceTime2View.snp.bottom)
            make.height.equalTo(70)
        }
        
        let notesLabel = UILabel()
        notesLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        notesView.addSubview(notesLabel)
        notesLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
        
        notesLabel.text = "Notes"
        
        let shareContactView = UIView()
        shareContactView.backgroundColor = .systemGray6
        containerView.addSubview(shareContactView)
        shareContactView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(notesView.snp.bottom)
            make.height.equalTo(70)
        }
        
        let shareContactLabel = UILabel()
        shareContactLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        shareContactView.addSubview(shareContactLabel)
        shareContactLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
        
        shareContactLabel.text = "Share Contact"
        shareContactLabel.textColor = .systemBlue
        
        let addToView = UIView()
        containerView.addSubview(addToView)
        addToView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(shareContactView.snp.bottom)
            make.height.equalTo(70)
        }
        
        let addToLabel = UILabel()
        addToLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        addToView.addSubview(addToLabel)
        addToLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
        
        addToLabel.text = "Add to Favorites"
        addToLabel.textColor = .systemBlue
        
        let shareView = UIView()
        shareView.backgroundColor = .systemGray6
        containerView.addSubview(shareView)
        shareView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(addToView.snp.bottom)
            make.height.equalTo(70)
        }
        
        let shareLabel = UILabel()
        shareLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        shareView.addSubview(shareLabel)
        shareLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(25)
        }
        
        shareLabel.text = "Share My Location"
        shareLabel.textColor = .systemBlue
    }
    
    private func createView(title: String, image: String, textColor: UIColor, backgroundColor: UIColor, imageTintColor: UIColor) -> UIView{
        let view = UIView()
        let view2 = UIView()
        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.contentMode = .scaleAspectFill
        let label = UILabel()
        label.text = title
        
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        
        view2.layer.cornerRadius = 20
        view2.clipsToBounds = true
        
        view.addSubview(view2)
        view2.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.width.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        view2.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view2.snp.bottom).offset(8)
        }
        view2.backgroundColor = backgroundColor
        imageView.tintColor = imageTintColor
        label.textColor = textColor

        return view
    }
}
