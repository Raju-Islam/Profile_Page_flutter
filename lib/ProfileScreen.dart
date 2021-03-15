import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String title = "Profile";
  final _globalkey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _professione = new TextEditingController();
  TextEditingController _dateofbirth = new TextEditingController();
  TextEditingController _title = new TextEditingController();
  TextEditingController _about = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  imageProfile(),
                  SizedBox(
                    height: 20,
                  ),
                  NameTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  ProfessionTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  DateOfBirth(),
                  SizedBox(
                    height: 20,
                  ),
                  TitleTextFormField(),
                  SizedBox(
                    height: 20,
                  ),
                  aboutTextFormField(),
                ],
              ),
            ),
            SizedBox(height: 13,),
            InkWell(
              onTap: () {
                if(_globalkey.currentState.validate()){
                  print("Validated");
                }

              },
              child: Center(
                child: Container(
                  child: Center(child: new Text("Submit",style: new TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)),

                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10),

                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70.00,
            backgroundImage: _image == null
                ? AssetImage("assets/profile.jpg")
                : FileImage(File(_image.path)),
          ),
          Positioned(
            bottom: 20.00,
            right: 20.00,
            child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomsheet()),
                  );
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.purple,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }

  PickedFile _image;
  final ImagePicker picker = ImagePicker();
  void getImage(ImageSource source) async {
    final pickedfile = await picker.getImage(source: source);
    setState(() {
      _image = pickedfile;
    });
  }

  //
  Widget bottomsheet() {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Chosse Profile Photo",
            style: new TextStyle(
              fontSize: 20.00,
              color: Colors.purple,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton.icon(
                icon: Icon(
                  Icons.camera,
                  color: Colors.black,
                  size: 45,
                ),
                label: Text(
                  "Camera",
                  style: new TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  getImage(ImageSource.camera);
                },
              ),
              SizedBox(
                width: 35,
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                icon: Icon(
                  Icons.photo_library,
                  color: Colors.black,
                  size: 45,
                ),
                label: Text(
                  "Gallery",
                  style: new TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  //
  Widget NameTextField() {
    return TextFormField(
      controller: _name,
      validator: (value) {
        if (value.isEmpty) return "Name can't ne empty";
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent,
            width: 1.5,
          )
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.purpleAccent,
        ),
        labelText: "Name",
        hintText: "Name",
        helperText: "Name can't be empty",
      ),
    );
  }

  Widget ProfessionTextField() {
    return TextFormField(
      controller: _professione,
      validator: (value) {
        if (value.isEmpty) return "Profession can't be empty";
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 1.5,
              )
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.purpleAccent,
          ),
          labelText: "Profession",
          hintText: "Flutter Developer",
          helperText: "Profession can't be empty"),
    );
  }

  Widget DateOfBirth() {
    return TextFormField(
      controller: _dateofbirth,
      validator: (value) {
        if (value.isEmpty) return "Can't be empty";
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 1.5,
              )
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.purpleAccent,
          ),
          labelText: "Date Of Birth",
          hintText: "dd/mm/yyyy",
          helperText: "Can't be empty"),
    );
  }

  Widget TitleTextFormField() {
    return TextFormField(
      controller: _title,
      validator: (value) {
        if (value.isEmpty) return "Title Can't be empty";
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
          ),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.greenAccent,
              width: 1.5,
            )
        ),
        prefixIcon: Icon(Icons.person, color: Colors.purpleAccent),
        labelText: "Title",
        hintText: "title",
        helperText: "Title can't be empty",
      ),
    );
  }

  Widget aboutTextFormField() {
    return TextFormField(
      controller: _about,
      validator: (value) {
        if (value.isEmpty) return "About Can't be empty";
      },
      maxLines: 4,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.purple,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.greenAccent,
                width: 1.5,
              )
          ),
          labelText: "About",
          hintText: "Discribe,",
          helperText: "about can't be empty"),
    );
  }
  //

}
