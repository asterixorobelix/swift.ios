//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by FullStackMacAir2 on 2018/11/27.
//  Copyright © 2018 asterixorobelix. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    
    var audioRecorder: AVAudioRecorder!;

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var recordingButton: UIButton!
    
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var recordingLabelText = "tap to record";
    var recordingLabelAltText = "recording in progress";
    var stopRecordingSegue = "stopRecordingSegue";
    
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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self;
        
        let audioSession = AVAudioSession.sharedInstance();
        
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = recordingLabelText
        stopRecordingButton.isEnabled = false;
        recordingButton.isEnabled = !stopRecordingButton.isEnabled;
        audioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance();
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if(flag){
            print("finished recording")
            performSegue(withIdentifier: stopRecordingSegue, sender:audioRecorder.url)
        }
        else{
            print("recording failed")
        }
    }
}

