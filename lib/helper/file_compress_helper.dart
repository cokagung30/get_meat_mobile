import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class FileCompressHelper {
  static Future<File?> compressFile(File file) async {
    final dir = await getTemporaryDirectory();

    final targetPath = dir.absolute.path +
        "/" +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.jpg';

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 50,
    );

    _logCompress(message: 'Comparasion File Path And Size');

    _logCompress(messagePair: {
      'File Path': file.path,
      'File Size': file.lengthSync(),
    });

    _logCompress(messagePair: {
      'New File Path': result?.path,
      'New File Size': result?.lengthSync(),
    });

    return result;
  }

  static Future<Directory> directoryFile() async {
    final directory = Directory('discas');

    if (!directory.existsSync()) {
      directory.createSync();
    }

    return directory;
  }

  static _logCompress({
    String? message,
    Map<String, dynamic>? messagePair,
  }) {
    var logger = Logger(
      filter: null,
      printer: PrettyPrinter(
        printTime: false,
        stackTraceBeginIndex: 0,
        methodCount: 0,
        printEmojis: false,
      ),
      output: null,
    );

    logger.i(message ?? messagePair);
  }
}
