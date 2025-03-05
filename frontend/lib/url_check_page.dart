import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'search_page.dart';

class UrlCheckPage extends StatefulWidget {
  @override
  _UrlCheckPageState createState() => _UrlCheckPageState();
}

class _UrlCheckPageState extends State<UrlCheckPage> {
  TextEditingController _urlController = TextEditingController();
  String _status = "empty"; // "empty", "safe", "unsafe"
  bool _showSearchButton = false;

  void _checkUrl() {
    setState(() {
      if (_urlController.text.isNotEmpty) {
        if (_urlController.text == "https://edu.ggueasy.com/") {
          _status = "safe"; // ✅ 안전한 URL 예제
        } else {
          _status = "unsafe"; // ✅ 안전하지 않은 URL 예제
        }
        _showSearchButton = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SearchPage()),
          ),
        ),
        title: _buildSearchBar(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildImage(),
            SizedBox(height: 24),
            _buildStatusMessage(),
            Expanded(child: SizedBox()), // ✅ 버튼을 아래로 정렬하기 위한 Expanded
            if (_showSearchButton) _buildSearchForMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade400, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _urlController,
              decoration: InputDecoration(
                hintText: "Enter URL",
                border: InputBorder.none,
              ),
              onSubmitted: (text) {
                _checkUrl();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: _checkUrl, // ✅ 검색 버튼 클릭 시 URL 검사
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    String imagePath = "assets/images/7-1.PNG"; // 기본 이미지
    if (_status == "unsafe") {
      imagePath = "assets/images/7-2.PNG"; // ✅ 안전하지 않은 URL일 경우
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildSearchForMoreButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
      child: Center(
        child: ElevatedButton(
          onPressed: () {}, // ✅ 추후 기능 추가 가능
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Text(
            "Search for more",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusMessage() {
    if (_status == "empty") {
      return Column(
        children: [
          Text(
            "Check the safety!",
            style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "URL",
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      );
    } else if (_status == "safe") {
      return Column(
        children: [
          Text(
            "This is a safe URL",
            style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "There are no reports so far",
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Text(
            "⚠️ Warning! Unsafe URL",
            style: GoogleFonts.rubik(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 4),
          Text(
            "This URL has been reported as unsafe.",
            style: GoogleFonts.rubik(
              fontSize: 16,
              color: Colors.red.shade700,
            ),
          ),
        ],
      );
    }
  }
}
