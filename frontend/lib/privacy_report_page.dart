import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'deepfake_report_page.dart';

class PrivacyReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Privacy Report",
          style: GoogleFonts.rubik(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "How to Report",
                style: GoogleFonts.rubik(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -1,
                ),
              ),
            ),
            SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "assets/images/3-1.PNG",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.22,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Report Methods",
              style: GoogleFonts.rubik(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Report in Security Breaches",
              style: GoogleFonts.rubik(
                fontSize: 15,
                color: Color.fromRGBO(120, 116, 109, 1),
              ),
            ),
            SizedBox(height: 12),
            Column(
              children: [
                _buildReportButton(
                  context,
                  "Phone numbers/Links/QR",
                  "assets/images/3-2.PNG",
                  () {},
                ),
                _buildReportButton(
                  context,
                  "Deepfake",
                  "assets/images/3-3.PNG",
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DeepfakeReportPage()),
                    );
                  },
                ),
                _buildReportButton(
                  context,
                  "Others",
                  "assets/images/3-4.PNG",
                  () {},
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildReportButton(BuildContext context, String title, String iconPath, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(205, 205, 205, 1), width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  iconPath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.rubik(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
