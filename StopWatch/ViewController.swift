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
//https://stackoverflow.com/questions/34929932/round-up-double-to-2-decimal-places/34930127

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // add a state machine
    enum TimerState {
        case initial
        case runing
        case notRuning
    }
    
    var timerState: TimerState = .initial
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elapsedTime = dataArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier:
            "BasicCell", for: indexPath)
        
        //the stopwatch show me quite much data so like to cut
           
        let elapsedTimeString = String(format: "%.4f", elapsedTime)
        cell.textLabel?.text = "\(elapsedTimeString)"
        cell.textLabel?.textAlignment = .center
        return cell
    
        
    }
    
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var timerLabel: UILabel!
    let stopwatch = Stopwatch()
    
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        if stopwatch.isRunning {
            // if the stopwatch started, stop it now
            stopwatch.stop()
            startButton.setTitle("start", for: .normal)
        } else {
            // if the stopwatch was stopped, start it now
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector:#selector(updateElapsedTimeLabel(timer:)),userInfo: nil, repeats: true)
            stopwatch.start()
            //When Srart button pressed change the word to Stop
            //https://soltveit.org/swift-change-uibutton-text/
            startButton.setTitle("stop", for: .normal)
        }
    }
    @objc func updateElapsedTimeLabel(timer:Timer) {
        if stopwatch.isRunning {
            timerLabel.text = stopwatch.elapsedTimeAsString
        } else{
            timer.invalidate()
        }
    }
    
    @IBAction func lapButtonPressed(_ sender: UIButton) {
        print(stopwatch.elapsedTime)
        
        // record the elapseTime
        let elapsedTime = stopwatch.elapsedTime
        // update tableView by reloadData
        dataArray.append(elapsedTime)
    
        
        //when lapbutton is pressed -> print stopwatch timer
        myTableView.reloadData()
        
        //When the stopbutton pressed change to restart
        

    }
    
 
    
    
    @IBOutlet weak var myTableView: UITableView!
    var dataArray: [TimeInterval] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }

    

}

