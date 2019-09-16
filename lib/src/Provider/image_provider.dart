import 'package:flutter/widgets.dart';

import '../Bloc/Image_bloc.dart';
import '../Api/Image_Api.dart';

class ImagesProvider extends InheritedWidget {
  final ImageBloc imageBloc;
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  //this static function basically takes the context of the widget that calls it then it looks up the
  // widget tree because every widget can look up every context above it in the widget tree, so the of function
  // is given a context then looks up the tree to find a widget of type/instance ImageProvider then it is casted back to type
  //  ImageProvider just to let dart know that it is of type ImageProvider. then we pulls the imageBloc property of that widget.
  static ImageBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(ImagesProvider) as ImagesProvider)
          .imageBloc;

  // Since the Provider wraps a widget we need to define a constructor
  ImagesProvider({Key key, ImageBloc imageBloc, Widget child})
      : this.imageBloc = imageBloc ?? ImageBloc(ImageAPI()),
        super(child: child, key: key);
}
