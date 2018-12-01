//
//  ViewController.swift
//  PitchPerfect
//
//  Created by FullStackMacAir2 on 2018/11/27.
//  Copyright © 2018 asterixorobelix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        print("record button pressed")
        recordingLabel.text = "recording in progress"
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        print("stop recording button pressed")
    }
}

