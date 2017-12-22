//
//  PlaySoundsViewController.swift
//  VoiceTuner
//
//  Created by Luis Puentes on 12/22/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        print("Hi")
    }
    @IBAction func stopButtonTapped(_ sender: Any) {
        print("Stop")
    }
}
