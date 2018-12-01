//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by FullStackMacAir2 on 2018/11/27.
//  Copyright © 2018 asterixorobelix. All rights reserved.
//

import UIKit

class RecordSoundsViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var recordingLabelText = "tap to record";
    var recordingLabelAltText = "recording in progress";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        stopRecordingButton.isEnabled = false;
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = recordingLabelAltText;
        stopRecordingButton.isEnabled = true;
        recordingButton.isEnabled = !stopRecordingButton.isEnabled;
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = recordingLabelText
        stopRecordingButton.isEnabled = false;
        recordingButton.isEnabled = !stopRecordingButton.isEnabled;
    }
}

