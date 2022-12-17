import 'package:dio/dio.dart';

import '../app/app.locator.dart';
import '../client/dio_client.dart';
import '../models/attachment.model.dart';
import '../models/support.model.dart';

class SupportService {
  Dio dioClient = locator<DioClient>().dio;

  Future<Support> createSupport(Map formData) async {
    var response = await dioClient.post(
      '/support',
      data: formData,
    );

    return Support.fromJson(response.data);
  }

  Future<Attachment> uploadAttachment(String filePath) async {
    var response = await dioClient.post(
      '/support/upload-attachment',
      data: FormData.fromMap(
        {
          'attachment': await MultipartFile.fromFile(filePath),
        },
      ),
    );

    return Attachment.fromJson(response.data);
  }
}
