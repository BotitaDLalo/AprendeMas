import 'package:aprende_mas/views/services/camera_gallery_service.dart';
import 'package:image_picker/image_picker.dart';

class CameraGalleryServiceImp extends CameraGalleryService{
  final ImagePicker _picker = ImagePicker();
  
  @override
  Future<String?> selectPhoto() async{
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40
    );

    if(photo == null) return null;

    return photo.path; 
  }

  @override
  Future<String?> takePhoto() async{
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.rear,
      imageQuality: 40
    );

    if(photo == null) return null;

    return photo.path; 
  }

}