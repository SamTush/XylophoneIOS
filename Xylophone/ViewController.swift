//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(letter: "C")
    }
    
    @IBAction func keyPressedD(_ sender: UIButton) {
        playSound(letter: "D")
    }
    
    @IBAction func keyPressedE(_ sender: UIButton) {
        playSound(letter: "E")
    }
    
    @IBAction func keyPressedF(_ sender: UIButton) {
        playSound(letter: "F")
    }
    
    
    @IBAction func keyPressedG(_ sender: UIButton) {
        playSound(letter: "G")
    }
    
    
    @IBAction func keyPressedA(_ sender: UIButton) {
        playSound(letter: "A")
    }
    
    
    @IBAction func keyPressedB(_ sender: UIButton) {
        playSound(letter: "B")
    }
    
    
    func playSound(letter: String){
        guard let url = Bundle.main.url(forResource: "\(letter)", withExtension: "wav")else {return}
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}

