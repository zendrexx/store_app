import 'package:admin_web/controllers/category_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categoriesscreen';
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CategoryController _categoryController = CategoryController();
  late String categoryName;
  dynamic _image;
  dynamic _bannerImage;
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

  pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (result != null) {
      setState(() {
        _bannerImage = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: TextFormField(
                    onChanged: (value) {
                      categoryName = value;
                    },
                    validator: (value) {
                      if (value!.isNotEmpty) {
                        return null;
                      } else {
                        return 'Please Enter Category Name';
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Enter Category name",
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Cancel", style: TextStyle(color: Colors.black)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _categoryController.uploadCategory(
                      pickedImage: _image,
                      pickedBanner: _bannerImage,
                      name: categoryName,
                      context: context,
                    );
                  }
                },
                child: Text("Save", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(width: 8),
              Column(
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
                    child: ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text("Pick Image"),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child:
                          _bannerImage != null
                              ? Image.memory(_bannerImage!)
                              : Text(
                                "Category Banner",
                                style: TextStyle(color: Colors.white),
                              ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        pickBannerImage();
                      },
                      child: Text('Pick Image'),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
