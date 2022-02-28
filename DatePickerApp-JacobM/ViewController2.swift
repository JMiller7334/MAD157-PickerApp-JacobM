//
//  ViewController2.swift
//  DatePickerApp-JacobM
//
//  Created by student on 2/27/22.
//

import UIKit

class ViewController2: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var multiPicker: UIPickerView!
    var comp1: [String] = []
    var comp2: [String] = []
    var comp3: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // config picker
        multiPicker.delegate = self
        multiPicker.dataSource = self
        comp1 = ["cat", "dog", "hamster", "lizard", "parrot", "goldfish"]
        comp2 = ["house", "apartment", "condo", "RV"]
        comp3 = ["indoor", "outdoor"]

        // Do any additional setup after loading the view.
    }
    //picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // switch statment needed for multi-component pickers
        switch component{
            case 0: return comp1.count
            case 1: return comp2.count
            default: return comp3.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component{
            case 0: return comp1[row]
            case 1: return comp2[row]
            default: return comp3[row]
        }
    }
    
    
    @IBAction func button3Tapped(_ sender: UIButton) {
        // get the selected values of each row - their index
        let petIndex = multiPicker.selectedRow(inComponent: 0)
        let homeIndex = multiPicker.selectedRow(inComponent: 1)
        let placeIndex = multiPicker.selectedRow(inComponent: 2)
        
        let alert3 = UIAlertController(title: "Summary", message: "\(comp1[petIndex]) \(comp2[homeIndex]) \(comp3[placeIndex])", preferredStyle: .alert)
        let alertAction3 = UIAlertAction(title: "OK", style: .default, handler: {action -> Void in})
        alert3.addAction(alertAction3)
        self.present(alert3, animated: true, completion: nil)
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
