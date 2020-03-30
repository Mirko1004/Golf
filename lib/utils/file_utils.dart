import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {

  static saveFileToTmp(File file) async {
    Directory tempDir = await getTemporaryDirectory();
    String path = tempDir.path;
    String name = basename(file.path);
    File tmp = File("$path/$name");
    var bytes = await file.readAsBytes();

    if(await tmp.exists())
      await tmp.delete();

    await tmp.writeAsBytes(bytes);

    return tmp;
  }
}