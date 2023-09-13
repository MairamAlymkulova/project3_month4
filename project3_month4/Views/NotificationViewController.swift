
import UIKit

class NotificationViewController: UIViewController {
    var notifications: [Notifications] = []
    private var stateGeneralBtn = true

    let tableView1: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    let tableView2: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        
        return tableView
    }()
    
    
    let cellId = "cell"
    
    private let topLbl = MakerView.shared.makeLabel(text: "Notification", font: .boldSystemFont(ofSize: 24), textColor: .black)
    
    private let settingBtn = MakerView.shared.makeButton(image: UIImage(systemName: "gearshape"), tinitColor: .black)
    private let generalBTn = MakerView.shared.makeButton(title: "General", titleColor: .red, font: .boldSystemFont(ofSize: 18))
    
    private let systemBtn = MakerView.shared.makeButton(title: "System", titleColor: .lightGray, font: .boldSystemFont(ofSize: 18))
    private let viewLine1: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.layer.cornerRadius = 5
        return view
    }()
    private let viewLine2: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 5

        return view
    }()
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView2.dataSource = self
        tableView2.delegate = self
        tableView2.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        
        initUI()
        initData()
        customNvigationBar()
        showTV()
    }
    
    private func initUI(){
        topLblConfig()
        
        settingBtnConfig()
        
        viewLine1Config()
        viewLine2Config()
        
        generalBtnConfig()
        syystemBtnConfig()
        
    }
    
    private func topLblConfig(){
        view.addSubview(topLbl)
        topLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            topLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            topLbl.heightAnchor.constraint(equalToConstant: 38)
        ])
    }
    
    private func settingBtnConfig(){
        view.addSubview(settingBtn)
        
        settingBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            settingBtn.centerYAnchor.constraint(equalTo: topLbl.centerYAnchor),
            settingBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            settingBtn.heightAnchor.constraint(equalToConstant: 28),
            settingBtn.widthAnchor.constraint(equalToConstant: 28)
        ])
    }
    
    private func viewLine1Config(){
        view.addSubview(viewLine1)
        
        viewLine1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewLine1.topAnchor.constraint(equalTo: topLbl.bottomAnchor, constant: 53),
            viewLine1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            viewLine1.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            viewLine1.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    
    private func viewLine2Config(){
        view.addSubview(viewLine2)
        
        viewLine2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viewLine2.topAnchor.constraint(equalTo: topLbl.bottomAnchor, constant: 53),
            viewLine2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            viewLine2.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            viewLine2.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
    private func generalBtnConfig(){
        view.addSubview(generalBTn)
        
        generalBTn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalBTn.topAnchor.constraint(equalTo: topLbl.bottomAnchor, constant: 24),
            generalBTn.centerXAnchor.constraint(equalTo: viewLine1.centerXAnchor),
            generalBTn.heightAnchor.constraint(equalToConstant: 28),
        ])
        
        generalBTn.addTarget(self, action: #selector(general), for: .touchUpInside)
    }
    @objc func general(){
        stateGeneralBtn = true
        let tableView = notificationChapter()

        tableViewConfig(tableView: tableView)

    }
    
    private func syystemBtnConfig(){
        view.addSubview(systemBtn)
        
        systemBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            systemBtn.topAnchor.constraint(equalTo: generalBTn.topAnchor),
            systemBtn.centerXAnchor.constraint(equalTo: viewLine2.centerXAnchor),
            systemBtn.heightAnchor.constraint(equalToConstant: 28),
        ])
        systemBtn.addTarget(self, action: #selector(system), for: .touchUpInside)
    }
    
    @objc func system(){
        stateGeneralBtn = false
        let tableView = notificationChapter()
        tableViewConfig(tableView: tableView)

    }
    private func tableViewConfig(tableView: UITableView){
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: viewLine1.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    private func initData(){
        notifications = [Notifications(userImg: "JCooper", notificationText: "Jane Cooper has published a new recipe!", time: "Today | 09:24 AM", contentImg: "cooper.publication"),
                      Notifications(userImg: "Rochel", notificationText: "Rochel has commented on your recipe", time: "1 day ago | 14:43 PM", contentImg: "rochel.publication"),
                         Notifications(userImg: "BWigington", notificationText: "Brad Wigington liked your comment", time: "1 day ago | 09:29 AM", contentImg: "wigington.publication"),
                      Notifications(userImg: "TBallentine", notificationText: "Tyra Ballentine has published a new recipe!", time: "2 days ago | 10:29 AM", contentImg: "balentine.publication"),
                         Notifications(userImg: "MWinkles", notificationText: "Marci Winkles has published a new recipe!", time: "3 days ago | 16:52 PM", contentImg: "winkles.publication"),
                         Notifications(userImg: "Aileen", notificationText: "Aileen has commented on your recipe", time: "4 days ago | 14:27 PM", contentImg: "aileen.publication"),
                      Notifications(userImg: "George", notificationText: "George has commented on your recipe", time: "5 days ago | 09:20 AM", contentImg: "george.publication")]
    }
    
    private func customNvigationBar(){
        navigationController?.navigationBar.tintColor = Colors.black
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.backgroundColor = .clear

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

    }
    @objc func backButtonPressed() {
        
        navigationController?.popViewController(animated: true)
    }
    
    private func notificationChapter() -> UITableView {
        if stateGeneralBtn{
            generalBTn.setTitleColor(.red, for: .normal)
            viewLine1.backgroundColor = .red
            systemBtn.setTitleColor(.lightGray, for: .normal)
            viewLine2.backgroundColor = .lightGray
            
            return tableView1
        }
        
        else{ generalBTn.setTitleColor(.lightGray, for: .normal)
            viewLine1.backgroundColor = .lightGray
            systemBtn.setTitleColor(.red, for: .normal)
            viewLine2.backgroundColor = .red
            return tableView2

        }
    }
    private func showTV(){
        if stateGeneralBtn{
            tableViewConfig(tableView: tableView1)
        }else{
            tableViewConfig(tableView: tableView2)
        }
    }
}
