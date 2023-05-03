//
//  ViewController.swift
//  ChallengeDay23
//
//  Created by Георгий Евсеев on 3.06.22.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Flag"

        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)

        for item in items {
            if item.hasSuffix("png") {
                flags.append(item)
            }
        }
        print(flags)

        let sortedFlags = flags.sorted(by: <)
        flags = sortedFlags
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        cell.imageView?.image = UIImage(named: flags[indexPath.row])
        

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flags[indexPath.row]

            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
