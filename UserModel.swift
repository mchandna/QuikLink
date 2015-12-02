import Foundation

class UserModel {
    
    static let sharedInstance = UserModel()
    
    
    var ID: String {
        get {
            return self.ID
        }
        set(newVal) {
            self.ID = newVal
        }
    }
    var qrCodeImage: UIImage?
//    var qrCodeImage: UIImage {
//        get {
//            return self.qrCodeImage
//        }
//        set(newVal) {
//            self.qrCodeImage = newVal
//        }
//    }
    var facebook: String {
        get {
            return self.facebook
        }
        set(newVal) {
            self.facebook = newVal
        }
    }
    var twitter: String {
        get {
            return self.twitter
        }
        set(newVal) {
            
            self.twitter = newVal
        }
    }
    var instagram: String {
        get {
            return self.instagram
        }
        set(newVal) {
            self.instagram = newVal
        }
    }
    
    
    func setQRCode() {
        var qrCode: CIImage!
        if ID != "" {
            let data = "Hi".dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter!.setValue(data, forKey: "inputMessage")
            filter!.setValue("Q", forKey: "inputCorrectionLevel")
            
            qrCode = filter!.outputImage!
        }
        qrCodeImage = UIImage(CIImage: qrCode)
    }
    
}