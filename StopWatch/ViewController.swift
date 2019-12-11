//
//  ViewController.swift
//  StopWatch
//
//  Created by Kim Yeon Jeong on 2019/12/11.
//  Copyright © 2019 Kim Yeon Jeong. All rights reserved.
// https://swifteducation.github.io/teaching_app_development_with_swift/stopwatch.html

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
    }
    

    
    @IBOutlet weak var timerLabel: UILabel!
    let stopwatch = Stopwatch()
    
    
    @IBAction func lapButtonPressed(_ sender: UIButton) {
        print("Starting stopwatch")
        stopwatch.start()
    }
    
    
    @IBAction func StartButtonPressed(_ sender: UIButton) {
        print(stopwatch.elapsedTime)
        stopwatch.stop()
        
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

