//
//  ViewController.swift
//  DatePickerApp-JacobM
//
//  Created by student on 2/27/22.
//

import UIKit
                                        // Datasource, viewDelagated needed for custom picker
class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    //MARK: IBOutlets
    // custom picker
    @IBOutlet var myPicker: UIPickerView!
    var pickerData:[String] = [] //array to hold options
    // date picker
    @IBOutlet weak var myDatePicker: UIDatePicker!
    let dateFomratter: DateFormatter = DateFormatter()
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // standard date picker setup
        dateFomratter.dateStyle = .short
        dateFomratter.timeStyle = .short
        
        //custom picker setup
        myPicker.delegate = self
        myPicker.dataSource = self
        pickerData = ["Cat", "Dog", "Hamster", "Lizard", "Goldfish"]
        
    }
    // custom picker functions
    // these were created view fix on the class: viewController -needed for custom Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // displays how many wheel options will appear
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    // except this one was written by hand... strange it shares the same name as prev func...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return pickerData[row]
    }
    
    //MARK: functions
    // standard date picker
    func showAlert(dateTime: String){ // create an alert
        let timeAlert = UIAlertController(title: "Selected Time", message: "\(dateTime)", preferredStyle: .alert)
        let timeAction = UIAlertAction(title: "OK", style: .default, handler:  { action -> Void in})
        timeAlert.addAction(timeAction)
        self.present(timeAlert, animated: true, completion: nil)
    }
    
    //MARK: Actions
    // standard date picker
    @IBAction func getCurrentDateTime(_ sender: UIButton) {
        let selectedDate: String = dateFomratter.string(from: myDatePicker.date) //get the date from the date picker I made earlier
        showAlert(dateTime: selectedDate)
    }
    
    // custom picker
    @IBAction func button2Tapped(_ sender: UIButton) {
        let pickerIndex = myPicker.selectedRow(inComponent: 0)
        let pickerAlert = UIAlertController(title: "Custom Picker", message: "\(pickerData[pickerIndex])", preferredStyle: .alert)
        let pickerAction = UIAlertAction(title: "OK", style: .default, handler: { action -> Void in})
        pickerAlert.addAction(pickerAction)
        self.present(pickerAlert, animated: true, completion: nil)
    }
}


