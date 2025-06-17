import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categoriesscreen';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  dynamic _image;
  @override
  Widget build(BuildContext context) {
    pickImage() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        setState(() {
          _image = result.files.first.bytes;
        });
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Divider(color: Colors.grey),
        ),

        Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child:
                    _image != null
                        ? Image.memory(_image!)
                        : Text(
                          "Category Image",
                          style: TextStyle(color: Colors.white),
                        ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Enter Category name"),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: Text("Save", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              pickImage();
            },
            child: Text("Pick Image"),
          ),
        ),
        Divider(color: Colors.grey),
      ],
    );
  }
}
