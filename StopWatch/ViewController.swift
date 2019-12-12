//
//  ViewController.swift
//  StopWatch
//
//  Created by Kim Yeon Jeong on 2019/12/11.
//  Copyright © 2019 Kim Yeon Jeong. All rights reserved.

// 作業 8 - 實作 iOS 時鐘 App 的碼錶和倒數計時器
//https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84%E8%A9%A6%E7%85%89-%E5%8B%87%E8%80%85%E7%9A%84-100-%E9%81%93-swift-ios-app-%E8%AC%8E%E9%A1%8C/61-%E5%AF%A6%E4%BD%9C-ios-%E6%99%82%E9%90%98-app-%E7%9A%84%E7%A2%BC%E9%8C%B6%E5%92%8C%E8%A8%88%E6%99%82%E5%99%A8-9a6b9b4288d1

//https://swifteducation.github.io/teaching_app_development_with_swift/stopwatch.html
// https://stackoverflow.com/questions/24755558/measure-elapsed-time-in-swift

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowData = dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "BasicCell", for: indexPath)
        cell.textLabel?.text = rowData
        return cell
        //print stopwatch timer
        //print(stopwatch.elapsedTime)
    }
    

    
    @IBOutlet weak var timerLabel: UILabel!
    let stopwatch = Stopwatch()
    
    
    @IBAction func lapButtonPressed(_ sender: UIButton) {
    
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(updateElsapsedTimeLabel(timer:)),userInfo: nil, repeats: true)
        stopwatch.start()
            
    }
    @objc func updateElsapsedTimeLabel(timer:Timer) {
        if stopwatch.isRunning {
            timerLabel.text = stopwatch.elapsedTimeAsString
        } else{
            timer.invalidate()
        }
    }
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        print(stopwatch.elapsedTime)
        stopwatch.stop()
        // change the title to stop
        
        // start
        
        //button pressed start to timer
        
       
        //When Srart button pressed change the word to Stop

    }
    
 
    
    
    @IBOutlet weak var myTableView: UITableView!
    let dataArray = ["number"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }

    

}

