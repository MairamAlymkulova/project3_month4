
import UIKit

class TableViewCell: UITableViewCell{
    
    private let cell = UITableViewCell()
    private var userImg = UIImageView()
    private var notificationLBL = MakerView.shared.makeLabel(textAlign: .left, font: .systemFont(ofSize: 18), textColor: Colors.black)
    private var time = MakerView.shared.makeLabel(textAlign: .left, font: .systemFont(ofSize: 14, weight: .thin), textColor: .gray)
    private var notificationImg = UIImageView()
    private let moreBtn = MakerView.shared.makeButton(image: UIImage(named: "more"))
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.heightAnchor.constraint(equalToConstant: 84).isActive = true
        
        contentView.addSubview(userImg)
        
        userImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userImg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImg.heightAnchor.constraint(equalToConstant: 48),
            userImg.widthAnchor.constraint(equalToConstant: 48)
        ])
        
        contentView.addSubview(notificationLBL)
        
        notificationLBL.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notificationLBL.leadingAnchor.constraint(equalTo: userImg.trailingAnchor, constant: 16),
            notificationLBL.topAnchor.constraint(equalTo: contentView.topAnchor),
            notificationLBL.heightAnchor.constraint(equalToConstant: 58),
            notificationLBL.widthAnchor.constraint(equalToConstant: 198)
        ])
        
        contentView.addSubview(time)
        
        time.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            time.leadingAnchor.constraint(equalTo: notificationLBL.leadingAnchor),
            time.topAnchor.constraint(equalTo: notificationLBL.bottomAnchor),
            time.heightAnchor.constraint(equalToConstant: 20),
            time.widthAnchor.constraint(equalToConstant: 198)
        ])
        
        contentView.addSubview(moreBtn)
        
        moreBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            moreBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            moreBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            moreBtn.widthAnchor.constraint(equalToConstant: 24),
            moreBtn.heightAnchor.constraint(equalToConstant: 24)
        ])
//
        contentView.addSubview(notificationImg)
        
        notificationImg.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notificationImg.leadingAnchor.constraint(equalTo: notificationLBL.trailingAnchor, constant: 5),
            notificationImg.trailingAnchor.constraint(equalTo: moreBtn.leadingAnchor, constant: -5),
            notificationImg.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            notificationImg.heightAnchor.constraint(equalTo: notificationImg.widthAnchor)
        ])
    }
    
    func setCellValues(usersImg: String, label: String, tiMe: String, publicImg: String) {
        userImg.image = UIImage(named: usersImg)
        notificationLBL.text = label
        time.text = tiMe
        notificationImg.image = UIImage(named: publicImg)
        print( "hello")
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
