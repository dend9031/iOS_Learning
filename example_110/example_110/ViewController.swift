import UIKit

class ViewController: UIViewController {
    @IBOutlet var countdowndatepicker: UIDatePicker!
    @IBOutlet var progressview: UIProgressView!
    @IBOutlet var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.datePicker.datePickerMode = .Date
        let dateComponents = NSDateComponents()
        dateComponents.year = 1990
        dateComponents.month = 2
        dateComponents.day = 4
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let date1 = calendar.dateFromComponents(dateComponents)!
        self.datePicker.minimumDate = date1
        self.datePicker.date = date1
        dateComponents.year = 2016
        let date2 = calendar.dateFromComponents(dateComponents)!
        self.datePicker.maximumDate = date2
    }
    
    @IBAction func doStep(sender:AnyObject){
        let stepper = sender as! UIStepper
        let maxStep = stepper.maximumValue
        let minStep = stepper.minimumValue
        let currentValue = stepper.value
        let progress = Float(currentValue/(maxStep-minStep))
        self.progressview.setProgress(progress, animated: true)
    }
    
    @IBAction func dateChanged(sender:AnyObject){
        let datepicker = sender as! UIDatePicker
        let date = datepicker.date
        let dateFormatter = NSDateFormatter()
        dateFormatter.timeStyle = .FullStyle
        dateFormatter.dateStyle = .FullStyle
        print(dateFormatter.stringFromDate(date))
    }
    
    @IBAction func countDownChanged(sender:AnyObject){
        let duration = countdowndatepicker.countDownDuration
        let countDownFormatter = NSDateComponentsFormatter()
        countDownFormatter.allowedUnits = [.Hour,.Minute,.Second]
        countDownFormatter.unitsStyle = .SpellOut
        if let s = countDownFormatter.stringFromTimeInterval(duration){
            print(s)
        }
    }
}

