import 'dart:async';

import '../models/image_model.dart';
import '../Api/Image_Api.dart';
import 'package:rxdart/rxdart.dart';

class ImageBloc {
  final ImageAPI api;

  Stream<List<Images>> _images = Stream.empty();

  BehaviorSubject<String> _query = BehaviorSubject<String>();

  Stream<List<Images>> get images => _images;
  Sink<String> get query => _query;

  ImageBloc(this.api) {
    _images = _query.distinct().asyncMap(api.makeRequest).asBroadcastStream();
  }

  void dispose() {
    _query.close();
  }
}
