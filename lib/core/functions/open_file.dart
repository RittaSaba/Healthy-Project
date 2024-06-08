import 'package:file_picker/file_picker.dart';

void openFile() async {
  FilePickerResult? resultFile = await FilePicker.platform.pickFiles();
  if (resultFile != null) {
    PlatformFile file = resultFile.files.first;
  } else {}
}
