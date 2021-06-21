import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:image_picker/image_picker.dart';
import 'package:urbandreamuser/models/Policy.dart';

class UploadFile {
  late bool success;
  late String message;

  late bool isUploaded;

  Future<void> call(PickedFile image) async {
    const _accessKeyId = 'AKIATOY4UOHNP4BVECPP';
    const _secretKeyId = '29FJIEaM8rxQna2oXXdBv63Zg0Tyd4hlFEpaapwz';
    const _region = 'ap-northeast-2';
    const _s3Endpoint =
        'https://historyblogkazakhstan.s3-ap-northeast-2.amazonaws.com';
    final stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
    final length = await stream.length;

    final uri = Uri.parse(_s3Endpoint);
    final req = http.MultipartRequest("POST", uri);
    final multipartFile = http.MultipartFile('file', stream, length,
        filename: path.basename(image.path));

    final policy = Policy.fromS3PresignedPost('uploaded/${image.path}',
        'historyblogkazakhstan', _accessKeyId, 15, length,
        region: _region);
    final key =
    SigV4.calculateSigningKey(_secretKeyId, policy.datetime, _region, 's3');
    final signature = SigV4.calculateSignature(key, policy.encode());

    req.files.add(multipartFile);
    req.fields['key'] = policy.key;
    req.fields['acl'] = 'public-read';
    req.fields['X-Amz-Credential'] = policy.credential;
    req.fields['X-Amz-Algorithm'] = 'AWS4-HMAC-SHA256';
    req.fields['X-Amz-Date'] = policy.datetime;
    req.fields['Policy'] = policy.encode();
    req.fields['X-Amz-Signature'] = signature;

    try {
      final response = await req.send();
      print(response);
      if (response.statusCode == 200) {
        isUploaded = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
