import 'dart:convert';

import 'package:gugu/src/api/apis.dart';
import 'package:flutter/material.dart';

class contentsByCategoriesServices {
  Api api = Api();

  Future getContents(BuildContext context, int categoryId) async {
    Map<String, dynamic> data = {
      'id': categoryId.toString(),
    };
    final response = await api.post(context, 'contents_by_categoryId', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future getContentsDetails(BuildContext context, int contentId) async {
    Map<String, dynamic> data = {
      'id': contentId.toString(),
    };
    final response = await api.post(context, 'content_details', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }

  Future getContentsVideos(BuildContext context, int contentId) async {
    Map<String, dynamic> data = {
      'id': contentId.toString(),
    };
    final response = await api.post(context, 'content_videos_by_id', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
}
