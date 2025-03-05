import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class DeepfakeSexualIntentPage extends StatelessWidget {
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Deepfake with Sexual Intent",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    "assets/images/4-1.PNG",
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Tap a service below to report or seek support.",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.rubik(
                    fontSize: 15,
                    color: Color.fromRGBO(120, 116, 109, 1),
                    fontWeight: FontWeight.normal,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildReportBox(
                          context,
                          title: "Korean Police",
                          subtitle: "File an online report and track the investigation process.",
                          url: "https://ecrm.police.go.kr/minwon/main",
                        ),
                        _buildReportBox(
                          context,
                          title: "Korea Communications Standards Commission (KCSC)",
                          subtitle: "Report harmful content, block sites, and receive victim support.",
                          url: "https://report.kocsc.or.kr/report/auth/digitalSexualAssault",
                        ),
                        _buildReportBox(
                          context,
                          title: "Digital Sex Crime Victim Support Center",
                          subtitle: "Get counseling, content removal assistance, and legal support.",
                          url: "https://d4u.stop.or.kr/",
                        ),
                        _buildReportBox(
                          context,
                          title: "Report illegal content on platforms",
                          subtitle: "Report deepfake videos on social media and web platforms.",
                          url: "",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildReportBox(BuildContext context, {required String title, required String subtitle, required String url}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: url.isNotEmpty ? () => _launchURL(url) : null,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: Color.fromRGBO(205, 205, 205, 1), width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.rubik(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 6),
              Text(
                subtitle,
                style: GoogleFonts.rubik(
                  fontSize: 14,
                  color: Color.fromRGBO(120, 116, 109, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
