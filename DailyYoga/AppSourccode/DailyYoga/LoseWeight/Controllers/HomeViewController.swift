//
//  HomeViewController.swift
//  LoseWeight
//
//  Created by Sprint on 04/12/2018.
//  Copyright © 2018 Sprint Solutions. All rights reserved.
//

import UIKit
import AVFoundation

var homeVC: HomeViewController!
let userDefaults = UserDefaults.standard
var dayIndex = 1

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var lblDays:UILabel!
    @IBOutlet var lblPercentage:UILabel!
    @IBOutlet var tblView:UITableView!
    @IBOutlet weak var progressBar: LinearProgressBar!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        homeVC = self
        let volumeFlag = userDefaults.integer(forKey: "volumeFlag")
        
        if volumeFlag < 1
        {
            userDefaults.set(1, forKey: "volumeFlag")
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
//        let day = userDefaults.integer(forKey: "cIndex")
//
//        if day == 0
//        {
//            userDefaults.set(1, forKey: "dayIndex")
//            lblDays.text = "7 day(s) left"
//            lblPercentage.text = "0"
//            progressBar.progressValue = 0
//        }
//        else if day > 1
//        {
//            lblDays.text = String(format: "%i days left", 7 - day)
//            lblPercentage.text = String(format: "%.0f", (Double(day) * 14.29))
//            progressBar.progressValue = CGFloat(Double(day) * 14.29)
//        }
//
//        tblView.reloadData()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle
    {
        return .lightContent
    }
    
    @IBAction func settingsBtnAction(_ sender:Any)
    {
        let settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 31
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:ExerciseCell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath) as! ExerciseCell
        
        cell.bgView.image = UIImage(named: String(format: "c%i",indexPath.row + 1))
        cell.bgView.layer.cornerRadius = 10
        cell.bgView.layer.masksToBounds = true
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        dayIndex = indexPath.row + 1
        
        let excVC = self.storyboard?.instantiateViewController(withIdentifier: "ExerciseVC") as! ExerciseVC
        self.navigationController?.pushViewController(excVC, animated: true)
    }
}

