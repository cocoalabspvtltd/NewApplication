import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_application/utils/user_utils.dart';
import '../utils/sharedpref.dart';


class ApiInterceptor extends Interceptor {
  int maxCharactersPerLine = 500;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (UserUtils.apiToken.isNotEmpty) {
      if (!options.headers.containsKey('authorization')) {
        options.headers.addAll({"Authorization": "Bearer ${UserUtils.apiToken}"});
      }

      // options.headers.addAll({"Authorization": "Bearer $s1"});
    }

    debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
    debugPrint(
        "REQUEST[${options.method}] => PATH: ${options.baseUrl}${options.path}");
    debugPrint("Headers:");
    options.headers.forEach((k, v) => debugPrint('$k: $v'));
    // ignore: unnecessary_null_comparison
    if (options.queryParameters != null) {
      debugPrint("QueryParameters:");
      options.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
    }
    if (options.data != null) {
      try {
        debugPrint('body:');
        FormData d = options.data;
        d.fields.forEach((element) {
          debugPrint('${element.key}:${element.value}');
        });
      } catch (e) {
        debugPrint("${options.data}");
      }
    }
    debugPrint("!!!!!!!!!!!!!!!!!!!! Request End !!!!!!!!!!!!!!!!!!!!!");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("************** Response Begin ************************");
    debugPrint("ResMethodType : [${response.requestOptions.method}]");
    debugPrint(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl}${response.requestOptions.path}");
    if (response.statusCode == 401) {
      SharedPrefs.logOut();
      Fluttertoast.showToast(msg:'Unauthorized');
    }

    String responseAsString = response.data.toString();
    if (responseAsString.length > maxCharactersPerLine) {
      int iterations = (responseAsString.length / maxCharactersPerLine).floor();
      for (int i = 0; i <= iterations; i++) {
        int endingIndex = i * maxCharactersPerLine + maxCharactersPerLine;
        if (endingIndex > responseAsString.length) {
          endingIndex = responseAsString.length;
        }
        debugPrint(
            responseAsString.substring(i * maxCharactersPerLine, endingIndex));
      }
    } else {
      debugPrint('''${response.data}''');
    }
    debugPrint("************** Response End ************************");

    // print('status code: ${response.statusCode}');
    // print('success response: ${response.data}');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("#################### Error Begin #########################");
    if (err.response != null) {
      debugPrint('status code: ${err.response!.statusCode}');
      debugPrint('error response: ${err.response!.data.toString()}');
      Fluttertoast.showToast(msg:err.response!.data['message']);

      if (err.response!.statusCode == 401) {
        SharedPrefs.logOut();
      }
    } else {
      debugPrint(err.toString());
    }
    debugPrint("#################### Error End #########################");

    super.onError(err, handler);
  }
}
