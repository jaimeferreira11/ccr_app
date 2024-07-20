import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FileHelper {
  static getFileName(String path) {
    return basename(path);
  }

  static Future<Uint8List> testCompressFile(File file) async {
    var result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 90,
    );
    log(file.lengthSync().toString());
    log(result!.length.toString());

    return result;
  }

  static Future<Uint8List> compressImageUnit8List(Uint8List list) async {
    var result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1024,
      minWidth: 1024,
      quality: 90,
    );
    log('List length: ${list.length}');
    log('List lengthInBytes: ${list.lengthInBytes}');
    log('Result length: ${result.length}');
    log('Result lengthInBytes: ${result.lengthInBytes}');

    result.lengthInBytes;

    return result;
  }

  static Future<XFile?> convertUint8ListToXFile(
      Uint8List data, String fullpath) async {
    // final path = fullpath.substring(0, fullpath.lastIndexOf('/'));
    final tempFile = File(fullpath);
    await tempFile.writeAsBytes(data);
    return XFile(tempFile.path);
  }

  static Future<double> getFileSize(String path) async {
    final File file = File(path);
    final int fileSizeInBytes = await file.length();
    final double fileSizeInKB = fileSizeInBytes / 1024;

    log('File size: ${fileSizeInKB.toStringAsFixed(2)} KB');

    return fileSizeInKB;
  }

  static Future<String?> saveImageToDirectory(XFile imageFile,
      {String? directoryPath, String? folderName, String? fileName}) async {
    try {
      // TODO: Revisar
      // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      bool isAndroidPermissionStorageGranted = true;

      // if (Platform.isAndroid) {
      //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      //   log('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
      //   if (androidInfo.version.sdkInt >= 33) {
      //     isAndroidPermissionStorageGranted = true;
      //   } else {
      //     isAndroidPermissionStorageGranted =
      //         await Permission.storage.request().isGranted;
      //   }
      // } else {
      //   isAndroidPermissionStorageGranted = true;
      // }

      // if (!isAndroidPermissionStorageGranted) {
      //   Get.snackbar(
      //     "Atención", // title
      //     "Acepta los permisos", // message
      //     icon: const Icon(
      //       Icons.warning,
      //       color: Colors.white,
      //     ),
      //     shouldIconPulse: true,
      //     snackPosition: SnackPosition.BOTTOM,
      //     isDismissible: true,
      //     backgroundColor: Colors.red.shade600,
      //     colorText: Colors.white,
      //     duration: const Duration(seconds: 3),
      //   );

      //   return null;
      // }

      final directory = directoryPath != null
          ? Directory(directoryPath)
          : await getExternalStorageDirectory();

      final appDirectory = folderName != null
          ? Directory('${directory!.path}/$folderName')
          : directory;

      if (!appDirectory!.existsSync()) {
        appDirectory.createSync(recursive: true);
      }

      final String imagePath =
          '${appDirectory.path}/${fileName ?? '${DateTime.now().millisecondsSinceEpoch}'}.jpg';
      final File file = File(imagePath);
      await imageFile.saveTo(file.path);

      return imagePath; // Retorna la ruta completa del archivo guardado
    } catch (e) {
      debugPrint('Error saving image: $e');
      return null;
    }
  }

  static Future<String?> saveImageIntoPath(
      {required XFile imageFile, required String fullPath}) async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      bool isAndroidPermissionStorageGranted = false;
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        if (androidInfo.version.sdkInt >= 33) {
          isAndroidPermissionStorageGranted = true;
        } else {
          isAndroidPermissionStorageGranted =
              await Permission.storage.request().isGranted;
        }
      } else {
        isAndroidPermissionStorageGranted = true;
      }

      if (!isAndroidPermissionStorageGranted) {
        Get.snackbar(
          "Atención", // title
          "Acepta los permisos", // message
          icon: const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          shouldIconPulse: true,
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          backgroundColor: Colors.red.shade600,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );

        return null;
      }

      final File file = File(fullPath);
      await imageFile.saveTo(file.path);

      return fullPath; // Retorna la ruta completa del archivo guardado
    } catch (e) {
      debugPrint('Error saving image: $e');
      return null;
    }
  }

  static void deleteImage(String imagePath) {
    try {
      File imageFile = File(imagePath);
      if (imageFile.existsSync()) {
        imageFile.deleteSync();
        log('Image deleted successfully');
      } else {
        log('Image not found');
      }
    } catch (e) {
      debugPrint('Error deleting image: $e');
    }
  }

  static File bytesToFile(Uint8List bytes) {
    return File.fromRawPath(bytes);
  }

  static Future<String?> convertFileToBase64(String filePath) async {
    try {
      final file = File(filePath);
      if (!await file.exists()) {
        throw Exception("File not found at the given path: $filePath");
      }

      final bytes = await file.readAsBytes();
      final base64String = base64Encode(bytes);
      return base64String;
    } catch (e) {
      print("Error converting file to base64: $e");
      return null;
    }
  }

  static Future<String> getFilePath(String fileName) async {
    final directory = await getExternalStorageDirectory();
    return "${directory!.path}/$fileName";
  }

  static Future<String> renameFile(
      {required String oldPath, required String newPath}) async {
    final file = File(oldPath);

    String directoryPath = dirname(oldPath);

    if (await file.exists() == false) {
      log('The file does not exist.');
      throw Exception('No existe el archivo');
    }
    try {
      final newFile = await file.rename('$directoryPath/$newPath.jpg');
      log('File renamed to: ${newFile.path}');
      return newFile.path;
    } catch (e) {
      log('Error renaming file: $e');
      throw Exception(e.toString());
    }
  }
}
