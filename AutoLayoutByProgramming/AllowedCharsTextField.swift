import UIKit


// 1
class AllowedCharsTextField: UITextField, UITextFieldDelegate {
    
    // 2
    @IBInspectable var allowedChars: String = ""
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // 3
        delegate = self
        // 4
        autocorrectionType = .no
    }
    
    // 5
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        // 6
        guard string.characters.count > 0 else {
            return true
        }
        
        // 7
        let currentText = textField.text ?? ""
        let prospectiveText = (currentText as NSString).replacingCharacters(in: range, with: string)
        return prospectiveText.contains(allowedChars)
    }
    
}
