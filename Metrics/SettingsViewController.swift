//
//  SettingsViewController.swift
//  Metrics
//
//  Created by Devjyoti Mohanty on 26/02/23.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model: Settingsoption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption{
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (()-> Void)
    let isOn: Bool
}

struct Settingsoption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self,
                       forCellReuseIdentifier: SettingTableViewCell.identifier)
        
        return table
    }()
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds

        // Do any additional setup after loading the view.
    }
    
    func configure(){
        models.append(Section(title: "General", options: [
            .staticCell(model: Settingsoption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
                print("Tapped first cell")
                
            }),
            .staticCell(model: Settingsoption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
                
            }),
            
                .staticCell(model: Settingsoption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
                    
                }),
            
                .staticCell(model: Settingsoption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
                    
                })
            
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model: Settingsoption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
                print("Tapped first cell")
                
            }),
            .staticCell(model: Settingsoption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
                
            }),
            
                .staticCell(model: Settingsoption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
                    
                }),
            
                .staticCell(model: Settingsoption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
                    
                })
            
        ]))
        
        models.append(Section(title: "Apps", options: [
            .staticCell(model: Settingsoption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
                print("Tapped first cell")
                
            }),
            .staticCell(model: Settingsoption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
                
            }),
            
                .staticCell(model: Settingsoption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen){
                    
                }),
            
                .staticCell(model: Settingsoption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
                    
                })
            
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                return UITableViewCell()
            }
            
            cell.configure(with: model)
            return cell
            
        case .switchCell(let model):
            return UITableViewCell()
        }
        
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
            
        case .staticCell(let model):
            model.handler()
            
        case .switchCell(let model):
            model.handler()
        }
    }

}
