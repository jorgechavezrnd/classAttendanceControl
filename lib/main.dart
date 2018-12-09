import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'dart:io';

const baseUrl = 'https://classattendancecontrol.herokuapp.com/compare';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de Asistencia a Clases',
      theme: ThemeData.dark(),
      home: ClassAttendanceControlApp(),
    ));

class ClassAttendanceControlApp extends StatefulWidget {
  @override
  _ClassAttendanceControlState createState() => _ClassAttendanceControlState();
}

class _ClassAttendanceControlState extends State<ClassAttendanceControlApp> {
  File image;

  void takePicture(String source) async {
    ImageSource imageSource;

    if (source == 'camera') {
      print('Camera');
      imageSource = ImageSource.camera;
    } else {
      print('Gallery');
      imageSource = ImageSource.gallery;
    }

    File img = await ImagePicker.pickImage(
        source: imageSource);

    if (img != null) {
      setState(() {
        image = img;
        image.length().then((len) {
          print('Tamanio: $len');
        });
      });
    }
  }

  void sendImage() {
    print('Send Image');
    
    Dio dio = new Dio();
    FormData formData = new FormData();
    formData.add('file', new UploadFileInfo(image, basename(image.path)));

    dio.post(baseUrl, data: formData, options: Options(
      method: 'POST',
      responseType: ResponseType.JSON
    )).then((response) => print(response))
      .catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Center(child: Text('Escoger Imagen'))),
        body: Container(
            child: Center(
          child: image == null
              ? Text('Imagen no seleccionada')
              : Image.file(image),
        )),
        bottomNavigationBar: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                  onPressed: () => takePicture('camera'),
                  child: Icon(Icons.camera_alt)),
              FloatingActionButton(
                  onPressed: () => image == null ? null : sendImage(),
                  child: Icon(Icons.check),
                  backgroundColor: image == null ? Colors.grey : null),
              FloatingActionButton(
                  onPressed: () => takePicture('gallery'),
                  child: Icon(Icons.image))
            ],
          ),
        ),
      );
}
