
import UIKit

class ConversionViewController: UIViewController {
    
//  let colors: [UIColor] = [.red, .yellow, .green, .blue, .purple]
    
    var conversionView: UIView!
    var lblArray: [UILabel]!
    var lbl: UILabel!
    
    override func loadView() {
        conversionView = UIView()
        
        view = conversionView
        conversionView.backgroundColor = .white
        
        lblArray = [UILabel](repeating: UILabel(), count: 5)
        let lblTexts = ["212", "degrees Fahrenheit", "is really", "100", "degrees Celcius"]
        
        lblArray[0] = UILabel()
        lblArray[0].text = lblTexts[0]
        lblArray[0].textAlignment = .center
        lblArray[0].font = lblArray[0].font.withSize(70)
        lblArray[0].textColor = UIColor(r: 225, g: 88, b: 41)
        
        lblArray[0].translatesAutoresizingMaskIntoConstraints = false
        conversionView.addSubview(lblArray[0])
        
        let topConstraint = lblArray[0].topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let margin = view.layoutMarginsGuide
        let leadingConstraint = lblArray[0].leadingAnchor.constraint(equalTo: margin.leadingAnchor)
        let trailingConstraint = lblArray[0].trailingAnchor.constraint(equalTo: margin.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        for i in 1..<lblArray.count {
            lblArray[i] = UILabel()
            lblArray[i].text = lblTexts[i]
            lblArray[i].textAlignment = .center
            if i == 3 {
                lblArray[i].font = lblArray[i].font.withSize(70)
            } else {
                lblArray[i].font = lblArray[i].font.withSize(36)
            }
            
            lblArray[i].translatesAutoresizingMaskIntoConstraints = false
            conversionView.addSubview(lblArray[i])
            
            
            let topConstraint = lblArray[i].centerYAnchor.constraint(equalTo: lblArray[i-1].bottomAnchor, constant: i == 3 ? 54 : 36)
            let margin = view.layoutMarginsGuide
            let leadingConstraint = lblArray[i].leadingAnchor.constraint(equalTo: margin.leadingAnchor)
            let trailingConstraint = lblArray[i].trailingAnchor.constraint(equalTo: margin.trailingAnchor)
            
            topConstraint.isActive = true
            leadingConstraint.isActive = true
            trailingConstraint.isActive = true
            
            if i == 2 {
                continue
            }
            
            lblArray[i].textColor = UIColor(r: 225, g: 88, b: 41)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        view.backgroundColor = colors[Int(arc4random_uniform(UInt32(colors.count)))] // Updating background color randomly
//    }
    
}

// MARK: – Extension
extension UIColor {
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        self.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            alpha: a
        )
    }
}
