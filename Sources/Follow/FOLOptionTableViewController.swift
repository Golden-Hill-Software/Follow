//
//  FOLOptionTableViewController.swift
//
//
//  Created by John Brayton on 2/4/24.
//

#if canImport(UIKit)
import UIKit
import SafariServices

class FOLOptionTableViewController : UITableViewController {
    
    let optionSections: [[FOLOption]]
    
    init( title: String, options: [FOLOption], needsCloseButton: Bool ) {
        self.optionSections = options.FOL_divideIntoSections()
        super.init(style: .grouped)
        self.title = title
        if needsCloseButton {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: String.localizedStringWithFormat("Done"), style: .done, target: self, action: #selector(handleClose(_:)))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.optionSections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.optionSections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        var content = cell.defaultContentConfiguration()
        
        let option = self.optionSections[indexPath.section][indexPath.row]
        switch option {
        case .action(let name, _, let icon):
            content.text = name
            content.image = icon.image
        case .separator:
            fatalError()
        }
        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        let option = self.optionSections[indexPath.section][indexPath.row]
        switch option {
        case .action(_, let action, _):
            switch action {
            case .copy(let string):
                UIPasteboard.general.string = string
            case .open(let url):
                UIApplication.shared.open(url)
            }
        case .separator:
            fatalError()
        }
    }
    
    @objc func handleClose( _ input: Any ) {
        self.navigationController?.dismiss(animated: true)
    }
    
    func getSymbol( named: String ) -> UIImage {
        let size: CGFloat = 32.0
        let configuration = UIImage.SymbolConfiguration(pointSize: size)
        let loadedImage = UIImage(systemName: named, withConfiguration: configuration)!
        let image = UIGraphicsImageRenderer(size: CGSize(width: size, height: size)).image { _ in
            loadedImage.draw(in: CGRect(origin: .zero, size: CGSize(width: size, height: size)))
        }
        return image.withRenderingMode(.alwaysTemplate)
    }
    
}

extension UIImage {
    func imageWith(newSize: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
        
        return image.withRenderingMode(renderingMode)
    }
}

#endif
