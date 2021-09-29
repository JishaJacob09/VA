// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Grievances extends StatefulWidget {
  const Grievances({Key? key}) : super(key: key);

  @override
  _GrievancesState createState() => _GrievancesState();
}

class _GrievancesState extends State<Grievances> {
  final File imageFile;
  bool _load = false;

  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();

    emailController.addListener(() => setState(() {}));
  }

  // late File imgFile;
  // final imgPicker = ImagePicker();
  
  // Future<void> showOptionsDialog(BuildContext context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Options"),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: [
  //                 GestureDetector(
  //                   child: Text("Capture Image From Camera"),
  //                   onTap: () {
  //                     _openCamera();
  //                   },
  //                 ),
  //                 Padding(padding: EdgeInsets.all(10)),
  //                 GestureDetector(
  //                   child: Text("Take Image From Gallery"),
  //                   onTap: () {
  //                     _openGallery();
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  // Future _openCamera() async {
  //   final imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     imgFile = File(imgCamera!.path);
  //   });
  //   // Navigator.of(context).pop();
  // }

  // void _openGallery() async {
  //   var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     imgFile = File(imgGallery!.path);
  //   });
  //   // Navigator.of(context).pop();
  // }
  //final imgPicker = ImagePicker();
  //late PickedFile _imageFile;

  Future<void> takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
      _load = false;
    });
  }

  Widget displayImage() {
    if (imageFile == null) {
      return Text("No Image Selected!");
    } else {
      return Image.file(imageFile, width: 350, height: 350);
    }
  }
// Widget _ImageView() {
//     if (_imageFile == null) {
//       return CircleAvatar(
        // radius: 80.0,
//         backgroundImage: AssetImage('assets/images/avatar_blank.jpeg'),
//       );
//     } else {
//       return CircleAvatar(
//         radius: 80.0,--
//         backgroundImage: FileImage(_imageFile!),
//       );
//     }
//   }
  Widget bottomSheet() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Text(
          "Choose a photo",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text("Camera"),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Gallery"),
              ),
            ]),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
  //review, display by rating, search by voice, search, coment, filter, multilingual,
  //form, location, gps,
  // recruiter, admin

  @override
  Widget build(BuildContext context) {
    // var imgFile;
    return Scaffold(
      appBar: AppBar(
        title: Text('Grievances'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Container(
    child: _load == true ?
    Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(imageFile),
        ),
        borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(15.0),
    ) :
    Padding(
      padding: const EdgeInsets.all(15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.asset(
            background.png,
            height: 250.0,
            width: 300.0,
            fit: BoxFit.cover,
          ),
        ),
    ),
  ),
            // displayImage(),
            // SizedBox(height: 30),
            // Center(
            //   child: Stack(children: <Widget>[
            //     CircleAvatar(
            //       radius: 40.0,
            //       child: Image.file(
            //         imageFile,
            //         fit: BoxFit.fitWidth,
            //       ),
                  // child: FileImage(PickedFile(_imageFile.path)),
                  // pickedfile(
                  //   _imageFile,
                  //   fit: BoxFit.cover,
                  // ),
                  // child: Image.file(_imageFile, fit: BoxFit.scaleDown),
                  //
                  // backgroundColor: Colors.grey,

                //  child:  displayImage()
                ),
                Positioned(
                  bottom: 20.0,
                  right: 20.0,
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((builder) => bottomSheet()),
                      );
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.teal,
                      size: 28.0,
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.normal),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Name',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (val) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Mobile'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter Mobile',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Email',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'name@example.com',
                        // labelText: 'Email',
                        // prefixIcon: Icon(Icons.mail),
                        //icon: Icon(Icons.mail),
                        suffixIcon: emailController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                onPressed: () => emailController.clear(),
                                icon: Icon(Icons.close),
                              ),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Comments'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: '  Enter your Comments',
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 40),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  Widget buildEmail() => Column(
        children: [
          Text(
            'Email',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'name@example.com',
              labelText: 'Email',
              prefixIcon: Icon(Icons.mail),
              //icon: Icon(Icons.mail),
              suffixIcon: emailController.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : IconButton(
                      onPressed: () => emailController.clear(),
                      icon: Icon(Icons.close),
                    ),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
        ],
      );
}

class MyTextFormField extends StatelessWidget {
  final String hintText;

  final bool isEmail;

  const MyTextFormField({
    Key? key,
    required this.hintText,
    this.isEmail = false,
    required String? Function(String value) validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: outlineInputBorder(
            borderSide: BorderSide(),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }

  outlineInputBorder({required BorderSide borderSide}) {}
}
