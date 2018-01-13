//
//  RecordingVoiceViewController.swift
//  VoiceTuner
//
//  Created by Luis Puentes on 12/21/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import UIKit
import AVFoundation

class RecordingVoiceViewController: UIViewController, AVAudioRecorderDelegate {

    // MARK: - Properties
    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI(isRecording: false)
    }
    
    // MARK: - Configuring UI
    func configureUI(isRecording: Bool) {
        if isRecording {
            recordingLabel.text = "Recording in progress..."
            recordButton.isEnabled = false
            stopRecordingButton.isEnabled = true
        } else {
            recordingLabel.text = "Tap to Record"
            recordButton.isEnabled = true
            stopRecordingButton.isEnabled = false
        }
    }
    
    // MARK: - Preparing Audio Recording Capability
    @IBAction func recordButtonTapped(_ sender: Any) {
        configureUI(isRecording: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    // MARK: - Ensuring the Audio Recorder Stops Recording
    @IBAction func stopRecordingButtonTapped(_ sender: Any) {
        configureUI(isRecording: false)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    // MARK: - Audio Recorder Delegate
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "toDetailVC", sender: audioRecorder.url)
        } else {
            print("Recording was not successful")
        }
    }
    
    // MARK: - Prepare for Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            let playSoundsVC = segue.destination as? PlaySoundsViewController
            let recordedAudioURL = sender as? URL
            playSoundsVC?.recordedAudioURL = recordedAudioURL
        }
    }
}
