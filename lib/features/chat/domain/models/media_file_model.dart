import 'package:image_picker/image_picker.dart';

class MediaFileModel{
  XFile? file;
  dynamic thumbnailPath;
  bool? isVideo;
  bool? isSvg;
  MediaFileModel({required this.file, required this.thumbnailPath, required this.isVideo, this.isSvg = false});
}