import UIKit

// MARK: - ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    
    var wordNotes = [
        ["title": "1", "all": [
            ["text": "hello"]
            ]
        ],
        ["title": "2", "all": [
            ["text": "nice"]
            ]
        ],
        ["title": "3", "all": [
            ["text": "to"],
            ["text": "meet"],
            ["text": "you"]
            ]
        ]
    ]
    
    // MARK: Table View Data Source Methods
    func numberOfSections(in tableView: UITableView) -> Int{
        return wordNotes.count
    }
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((wordNotes[section]["all"] as AnyObject).count)!
    }
    
    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")!
        let section = wordNotes[indexPath.section]
        let row = (section["all"] as AnyObject)[indexPath.row] as AnyObject
        cell.textLabel?.text = row["text"] as? String
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return wordNotes[section]["title"] as? String
    }
}

