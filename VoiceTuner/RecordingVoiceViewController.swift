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
    @IBOutlet weak var recordingLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func recordButtonTapped(_ sender: Any) {
        print("This ish works!")
    }
    
    @IBAction func stopRecordingButtonTapped(_ sender: Any) {
    }
}
