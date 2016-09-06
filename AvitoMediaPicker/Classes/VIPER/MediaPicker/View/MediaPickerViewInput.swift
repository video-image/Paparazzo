import UIKit
import AVFoundation
import AvitoDesignKit

enum MediaPickerViewMode {
    case Camera
    case PhotoPreview(MediaPickerItem)
}

enum MediaPickerTitleStyle {
    case Dark
    case Light
}

protocol MediaPickerViewInput: class {
    
    func setMode(_: MediaPickerViewMode)
    func adjustForDeviceOrientation(_: DeviceOrientation)
    
    func setCameraOutputParameters(_: CameraOutputParameters)
    func setCameraOutputOrientation(_: ExifOrientation)
    
    func setPhotoTitle(_: String)
    func setPhotoTitleStyle(_: MediaPickerTitleStyle)
    func setPhotoTitleAlpha(_: CGFloat)
    func setContinueButtonTitle(_: String)
    func setContinueButtonEnabled(_: Bool)

    func setLatestLibraryPhoto(_: ImageSource?)
    
    func setFlashButtonVisible(_: Bool)
    func setFlashButtonOn(_: Bool)
    func animateFlash()
    
    func addItems(_: [MediaPickerItem], animated: Bool, completion: () -> ())
    func updateItem(_: MediaPickerItem)
    func removeItem(_: MediaPickerItem)
    func selectItem(_: MediaPickerItem)
    func scrollToItemThumbnail(_: MediaPickerItem, animated: Bool)
    
    func selectCamera()
    func scrollToCameraThumbnail(animated animated: Bool)
    
    func setCameraControlsEnabled(_: Bool)
    func setCameraButtonVisible(_: Bool)
    func setShutterButtonEnabled(_: Bool)
    func setPhotoLibraryButtonEnabled(_: Bool)
    
    var onCloseButtonTap: (() -> ())? { get set }
    var onContinueButtonTap: (() -> ())? { get set }
    
    var onCameraToggleButtonTap: (() -> ())? { get set }
    func setCameraToggleButtonVisible(_: Bool)
    
    // MARK: - Actions in photo ribbon
    var onItemSelect: (MediaPickerItem -> ())? { get set }
    
    // MARK: - Camera actions
    var onPhotoLibraryButtonTap: (() -> ())? { get set }
    var onShutterButtonTap: (() -> ())? { get set }
    var onFlashToggle: (Bool -> ())? { get set }
    
    // MARK: - Selected photo actions
    var onRemoveButtonTap: (() -> ())? { get set }
    var onCropButtonTap: (() -> ())? { get set }
    var onCameraThumbnailTap: (() -> ())? { get set }
    
    var onSwipeToItem: (MediaPickerItem -> ())? { get set }
    var onSwipeToCamera: (() -> ())? { get set }
    var onSwipeToCameraProgressChange: (CGFloat -> ())? { get set }
    
    var onViewDidLoad: (() -> ())? { get set }
    var onViewDidAppear: ((animated: Bool) -> ())? { get set }
    
    var onPreviewSizeDetermined: ((previewSize: CGSize) -> ())? { get set }
}