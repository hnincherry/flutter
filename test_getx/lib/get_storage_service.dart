import 'package:get_storage/get_storage.dart';

class GetStorageService {
  final box = GetStorage();

  void saveToDevice(String data) {
    box.write("info", data);
  }

  String getData() {
    return box.read("info") ?? "";
  }
}
