import 'package:flutter/material.dart';
import 'screens/imagelist.dart';
import './Provider/image_provider.dart';
import './Bloc/Image_bloc.dart';
import './Api/Image_Api.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    // wrap our application with the Images Provider
    return ImagesProvider(
      imageBloc: ImageBloc(ImageAPI()),
      child: MaterialApp(
        title: 'View Images',
        theme: new ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('View Images'),
          ),
          body: ImageList(),
        ),
      ),
    );
  }
}
