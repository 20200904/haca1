import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/deepfake_sexual_intent_page.dart';

class DeepfakeReportPage extends StatelessWidget {
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
          "Deepfake Report",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "How to Report",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: 30,
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
                "assets/images/4-0.png",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
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
              ),
            ),
            SizedBox(height: 6),
            Text(
              "Report in Security Breaches",
              style: GoogleFonts.rubik(
                fontSize: 15,
                color: Color.fromRGBO(120, 116, 109, 1),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Column(
                children: [
                  _buildReportBox(
                    context,
                    title: "Deepfake with Sexual Intent",
                    imagePath: "assets/images/4-1.PNG",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeepfakeSexualIntentPage(),
                        ),
                      );
                    },
                  ),
                  _buildReportBox(
                    context,
                    title: "Deepfake-Generated Misinformation & Fake News",
                    imagePath: "assets/images/4-2.PNG",
                    onTap: () {},
                  ),
                  _buildReportBox(
                    context,
                    title: "Deepfake-Based Financial Fraud & Voice Phishing",
                    imagePath: "assets/images/4-3.PNG",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportBox(BuildContext context, {required String title, required String imagePath, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(205, 205, 205, 1), width: 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  imagePath,
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
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
