//
//  RecordingVoiceViewController.swift
//  VoiceTuner
//
//  Created by Luis Puentes on 12/21/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class RecordingVoiceViewController: UIViewController {

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopRecordingButton.isEnabled = false
    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        recordingLabel.text = "Recording in progress."
        recordingLabel.text = "Recording in progress.."
        recordingLabel.text = "Recording in progress..."
        recordButton.isEnabled = false
        stopRecordingButton.isEnabled = true
    }
    
    @IBAction func stopRecordingButtonTapped(_ sender: Any) {
        recordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false
        recordButton.isEnabled = true
    }
}
