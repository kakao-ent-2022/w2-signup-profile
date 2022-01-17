//
//  EditViewController.swift
//  KakaoProfile
//
//  Created by terry.yes on 2022/01/17.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var imageEditButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageEditButton.layer.cornerRadius = 0.5 * imageEditButton.bounds.size.width
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
