//
//  ViewController.swift
//  iosdatetimepickerstudy
//
//  Created by kenan on 14.08.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    
    @IBOutlet weak var timeTextField: UITextField!
    
    var datePicker:UIDatePicker?
    var timePicker:UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        dateTextField.inputView = datePicker
        
        datePicker?.preferredDatePickerStyle = .wheels
        timePicker?.preferredDatePickerStyle = .wheels
        
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        timeTextField.inputView = timePicker
        
        datePicker?.addTarget(self, action: #selector(self.showDate(datePicker:)), for: .valueChanged)
        
        timePicker?.addTarget(self, action: #selector(self.showTime(timePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureRecognizerMethod))
        view.addGestureRecognizer(tapGesture)
    }
    
   @objc func showDate(datePicker:UIDatePicker){
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MM/dd/yyyy"
       let selectedDate = dateFormatter.string(from: datePicker.date)
       dateTextField.text = selectedDate
    }
    
    @objc func showTime(timePicker:UIDatePicker){
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "hh:mm"
        let selectedTime = timeFormatter.string(from: timePicker.date)
        timeTextField.text = selectedTime
    }
    
    @objc func tapGestureRecognizerMethod(){
        view.endEditing(true)
    }


}

