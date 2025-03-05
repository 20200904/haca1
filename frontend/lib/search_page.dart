import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'url_check_page.dart'; // ✅ URL 검사 페이지 import

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Search",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/6-1.png",
                width: 200, // ✅ 크기 증가
                height: 200, // ✅ 크기 증가
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 24),
            _buildSearchButton(context, "QR"),
            SizedBox(height: 12),
            _buildSearchButton(context, "Link"), // ✅ URL 검사 기능을 Link 버튼에 적용
            SizedBox(height: 12),
            _buildSearchButton(context, "PhoneNumber"),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context, String text) {
    return GestureDetector(
      onTap: () {
        if (text == "Link") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrlCheckPage()), // ✅ 기존 URL 검사 기능을 Link 버튼에 적용
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.rubik(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
