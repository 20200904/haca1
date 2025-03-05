import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class ImageProtectionPage extends StatefulWidget {
  @override
  _ImageProtectionPageState createState() => _ImageProtectionPageState();
}

class _ImageProtectionPageState extends State<ImageProtectionPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  String buttonText = "Upload";
  html.File? _webImage;
  Uint8List? _webImageData;

  Future<void> _pickImage() async {
    if (kIsWeb) {
      final input = html.FileUploadInputElement()..accept = 'image/*';
      input.click();
      input.onChange.listen((event) {
        final file = input.files?.first;
        if (file != null) {
          final reader = html.FileReader();
          reader.readAsArrayBuffer(file);
          reader.onLoadEnd.listen((event) {
            setState(() {
              _webImage = file;
              _webImageData = reader.result as Uint8List;
              buttonText = "Change Image";
            });
          });
        }
      });
    } else {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
          buttonText = "Change Image";
        });
      }
    }
  }

  void _applyNoise() {
    if (_image != null || _webImage != null) {
      setState(() {
        buttonText = "Download";
      });
    }
  }

  Future<void> _downloadImage() async {
    if (kIsWeb && _webImageData != null) {
      final blob = html.Blob([_webImageData!]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", _webImage!.name)
        ..click();
      html.Url.revokeObjectUrl(url);
    } else if (!kIsWeb && _image != null) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/downloaded_image.png';
      final newFile = await _image!.copy(filePath);
      print("File saved to: ${newFile.path}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Image Protection",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Adding noise to images makes AI deepfakes harder, protecting your identity.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.85,
                height: screenHeight * 0.45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: Center(
                  child: _webImageData != null
                      ? Image.memory(_webImageData!, fit: BoxFit.cover)
                      : _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Icon(Icons.image, size: screenWidth * 0.2, color: Colors.grey.shade400),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: buttonText == "Upload" || buttonText == "Change Image"
                    ? _pickImage
                    : _downloadImage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.orange, width: 2),
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15, vertical: 16),
                ),
                child: Text(buttonText, style: TextStyle(fontSize: 16)),
              ),
              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFBF5EF),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildNoiseButton("LOW", screenWidth),
                    _buildNoiseButton("MED", screenWidth),
                    _buildNoiseButton("HIGH", screenWidth),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNoiseButton(String text, double screenWidth) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          onPressed: _applyNoise,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFBF5EF),
            foregroundColor: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          ),
          child: Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
