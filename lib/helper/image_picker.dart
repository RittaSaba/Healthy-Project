import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

RxString imagePath = ''.obs;
final getStorage = GetStorage();

Future getImage() async {
  final ImagePicker picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.gallery);

  if (image != null) {
    getStorage.save();
    imagePath.value = image.path.toString();
    getStorage.write('profile image', image.path.toString());
  }
}
