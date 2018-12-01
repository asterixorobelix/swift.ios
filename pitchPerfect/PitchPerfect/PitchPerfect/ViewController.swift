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
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        stopRecordingButton.isEnabled = false;
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        print("record button pressed")
        recordingLabel.text = "recording in progress"
        stopRecordingButton.isEnabled = true;
        recordingButton.isEnabled = false;
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = "tap to record";
        stopRecordingButton.isEnabled = false;
        recordingButton.isEnabled = true;
    }
}

