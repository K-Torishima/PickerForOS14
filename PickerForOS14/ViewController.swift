//
//  ViewController.swift
//  PickerForOS14
//
//  Created by koji torishima on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    private var textFieldInputDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
//        datePicker.datePickerMode = .countDownTimer
//        datePicker.datePickerMode = .date
//        datePicker.datePickerMode = .dateAndTime
//        datePicker.datePickerMode = .time
//        datePicker.preferredDatePickerStyle = .compact
        textField.inputView = textFieldInputDatePicker
        /// これはTextField選択時のモードを選択できる。
        textFieldInputDatePicker.preferredDatePickerStyle = .inline
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)

        // インプットビュー設定(紐づいているUITextfieldへ代入)
        textField.inputView = textFieldInputDatePicker
        textField.inputAccessoryView = toolbar
    }
    
    @objc func done() {
           textField.endEditing(true)
           // 日付のフォーマット
           let formatter = DateFormatter()
           //"yyyy年MM月dd日"を"yyyy/MM/dd"したりして出力の仕方を好きに変更できるよ
           formatter.dateFormat = "yyyy年MM月dd日"
           //(from: datePicker.date))を指定してあげることで
           //datePickerで指定した日付が表示される
           textField.text = "\(formatter.string(from: textFieldInputDatePicker.date))"



       }


}

