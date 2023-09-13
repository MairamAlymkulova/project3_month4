

import UIKit

extension NotificationViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return notifications.count
        }
        else{
            return 10
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        as! TableViewCell
        if tableView == tableView1{
            let userImage = notifications[indexPath.row].userImg
            let notification = notifications[indexPath.row].notificationText
            let time = notifications[indexPath.row].time
            let notificationImg = notifications[indexPath.row].contentImg
            
            cell.setCellValues(usersImg: userImage, label: notification, tiMe: time, publicImg: notificationImg)
            
        }else{
            cell.textLabel?.text = "\(indexPath.row)"
            cell.imageView?.image = UIImage(systemName: "user")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "delete"){_,_ in
            self.notifications.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        delete.backgroundColor = .red
        return [delete]
    }
    
    
}
