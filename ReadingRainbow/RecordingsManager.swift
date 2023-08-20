//
//  RecordingsManager.swift
//  ReadingRainbow
//
//  Created by Ami Smith on 8/19/23.
//

import Foundation
import Dependencies
import AVFoundation

 enum RecordingKey: DependencyKey {
    static let liveValue = RecordingKey.live
}

 extension DependencyValues {
    var recordingKey: RecordingKey {
        get { self[RecordingKey.self] }
        set { self[RecordingKey.self] = newValue}
    }
}


class RecordingsManager {
    private var recordings: [Recording: String] = [:]
    static let defaultFileName = "AudioRecording"
    static let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let storageURL = FileManager.documentDirectory.appendingPathComponent("AllRecordings")
    
    var audioRecorder: AVAudioRecorder?
    var startTime: Date?
    var timer: Timer?
    var audioPlayer: AVAudioPlayer?
    var playbackTimer: Timer?
    
    var destinationURL: URL?
    
    @Published var isRecording: Bool = false
    @Published var elapsedTime: TimeInterval = 0
    @Published var isPaused: Bool = false
    
    //    override init () {
    //        super.init()
    //        loadRecordings()
    //    }
    
    func requestMicrophoneAccess() {
        AVAudioSession.sharedInstance().requestRecordPermission {
            granted in
            if granted {
                do {
                    let audiosession = AVAudioSession.sharedInstance()
                    try audiosession.setCategory(.playAndRecord, mode: .default)
                    try audiosession.setActive(true)
                    
                    let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    self.destinationURL = documentDirectory.appendingPathComponent("recording.wav")
                    
                    let settings = [
                        AVFormatIDKey: Int(kAudioFormatLinearPCM),
                        AVSampleRateKey: 44100.0,
                        AVNumberOfChannelsKey: 2,
                        AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
                    ] as [String : Any]
                    
                    self.audioRecorder = try AVAudioRecorder(url: self.destinationURL!, settings: settings)
                    self.audioRecorder?.prepareToRecord()
                    
                } catch {
                    
                }
            } else {
                // microphone access denied
            }
        }
    }
    
    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            destinationURL = documentDirectory.appendingPathComponent("recording.wav")
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatLinearPCM),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ] as [String : Any]
            
            audioRecorder = try AVAudioRecorder(url: destinationURL!, settings: settings)
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            isRecording = true
        } catch {
            print("Failed to setup the recording")
        }
        if isPaused {
            audioRecorder?.record()
            isRecording = true
        } else {
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            isRecording = true
        }
        
        startTime = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.elapsedTime = audioRecorder?.currentTime ?? 0
        }
        
    }
    func pauseRecording() {
        if isRecording {
            audioRecorder?.pause()
            isPaused = true
        }
    }
    
    func resume() {
        audioRecorder?.record()
        isPaused = false
        isRecording = true
    }
    
    func stopRecording() {
        guard let audioRecorder = audioRecorder else {
            print("tried to stop with no audio recording.")
            return
        }
        audioRecorder.stop()
        let recordingDefaultName = audioRecorder.url.lastPathComponent
        let destinationURL = FileManager.renameFileInDocumentsDirectory(from: recordingDefaultName, to: Self.defaultFileName + "\(recordings.count)")!
        print("audio created at \(destinationURL)")
        self.audioRecorder = nil
        isRecording = false
        timer?.invalidate()
        timer = nil
        isPaused = false
        
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            print("Failed to deactivate audioSession: \(error.localizedDescription)")
        }
        addRecording(destinationURL, url: Recording(title: "Recording \(recordings.count + 1)", duration: audioRecorder.currentTime, dateCreated: Date()))
    }
    
    func loadRecordings() {
        do {
            let fileURL = Self.storageURL
            let loadedData = try Data(contentsOf: fileURL)
            recordings = try JSONDecoder().decode([Recording: String].self, from: loadedData)
        } catch {
            print("Failed to load recordings: \(error.localizedDescription)")
        }
    }
    func saveRecordings() {
        do {
            let data = try JSONEncoder().encode(recordings)
            let fileURL = Self.storageURL
            try data.write(to: fileURL)
            print("Recordings saved at: \(fileURL)")
        } catch {
            print("Failed to save recordings: \(error.localizedDescription)")
        }
    }
    
    func addRecording(_ recording: Recording, url: String) {
        recordings[recording] = url
        addRecording(recording, url: url)
        // TODO: do catch
        saveRecordings()
    }
    func playRecording(_ recording: Recording) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: recording.url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            
            playbackTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let self = self else { return }
                self.elapsedTime = self.audioPlayer?.currentTime ?? 0
            }
        } catch {
            print("Failed to play the recording: \(error.localizedDescription)")
        }
    }
    
    func stopPlayback() {
        audioPlayer?.stop()
        playbackTimer?.invalidate()
        playbackTimer = nil
    }
    
    func reRecord(_ recording: Recording) {
        stopPlayback()
        isRecording = true
        isPaused = false
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            
            destinationURL = recording.url
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatLinearPCM),
                AVSampleRateKey: 44100.0,
                AVNumberOfChannelsKey: 2,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ] as [String : Any]
    
            audioRecorder = try AVAudioRecorder(url: destinationURL!, settings: settings)
            audioRecorder?.prepareToRecord()
            audioRecorder?.record()
            
            startTime = Date()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
                guard let  self = self, let startTime = self.startTime else { return }
                self.elapsedTime = self.audioRecorder?.currentTime ?? 0
            }
        } catch {
            print("Failed to set up re-recording: \(error.localizedDescription)")
        }
    }
}
    


