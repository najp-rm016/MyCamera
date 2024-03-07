import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    class Coordinator: NSObject,
                       UINavigationControllerDelegate,
                       UIImagePickerControllerDelegate {
        
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView) {
            self.parent = parent
        }
        
//      // 撮影が終わったときに呼ばれるdelegateメソッド、必ず必要
        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info:
            [UIImagePickerController.InfoKey : Any]) {
            // 撮影した写真をcaptureImageに保存
            if let originalImage =
                info[UIImagePickerController.InfoKey.originalImage]
                as? UIImage {
                parent.captureImage = originalImage
            }
                // sheetを閉じない
            parent.isShowSheet = true
        }
        
        func imagePickerControllerDidancel(
            _ picker: UIImagePickerController){
                parent.isShowSheet = false
            }
    }
    
    func makeCoordinator() -> Coordinator{
        Coordinator(self)
    }
    
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
            let myImagePickerController = UIImagePickerController()
            myImagePickerController.sourceType = .camera
            myImagePickerController.delegate = context.coordinator
            return myImagePickerController
        }
    
    func updateUIViewController(
        _ uiViewController: UIImagePickerController,
        context: UIViewControllerRepresentableContext<ImagePickerView>)
    {
        
    }
}
