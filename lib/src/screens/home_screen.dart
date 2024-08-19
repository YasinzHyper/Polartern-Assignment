import 'package:flutter/material.dart';
import 'package:polartern_assignment/src/widgets/DetailCard.dart';
import '../widgets/CarouselSlider.dart';
import 'package:slider_button/slider_button.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
// import 'dart:io';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isRSVPed = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Screenshot(
        controller: screenshotController,
        child: Stack(
          children: [
            Container(
              color: Colors.white,
              height: screenHeight,
              child: Column(
                children: [
                  CarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Road trip to the hills',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.grey,
                              ),
                              onPressed: () async {
                                await _takeScreenshotAndShare();
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: DetailCard(
                                title: 'Date and Time',
                                icon: Icons.access_time_rounded,
                                child: Text(
                                  '26th Aug, \'24 - 2:00PM',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: DetailCard(
                                title: 'Cost',
                                icon: Icons.account_balance_wallet_rounded,
                                child: Text(
                                  '\$500',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        DetailCard(
                          title: 'Location',
                          icon: Icons.pin_drop_outlined,
                          child: Text(
                            'Frankfurt, Germany',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Embark on a scenic road trip to the hills and experience nature’s tranquility like never before. Book your adventure now and immerse yourself in the serene beauty of the hills!',
                          style: TextStyle(
                            color: Color.fromARGB(255, 53, 53, 53),
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DetailCard(
                          title: 'Hosts',
                          icon: Icons.person_outline,
                          child: Image.asset(
                            'assets/images/avatar.png',
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SliderButton(
                      boxShadow: null,
                      backgroundColor: _isRSVPed
                          ? Color.fromARGB(255, 22, 168, 112)
                          : Color.fromARGB(255, 22, 163, 168),
                      width: screenWidth * 1,
                      alignLabel: Alignment.center,
                      buttonColor: _isRSVPed
                          ? Color.fromARGB(255, 126, 245, 199)
                          : Color.fromARGB(255, 160, 209, 211),
                      buttonSize: 50,
                      action: () async {
                        setState(() {
                          _isRSVPed = !_isRSVPed;
                        });
                        return false;
                      },
                      label: Text(
                        _isRSVPed ? "RSVP'ed" : "Slide to RSVP",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 141, 141, 141),
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                      icon: Icon(
                        !_isRSVPed ? Icons.close_rounded : Icons.check,
                        size: 28,
                      ),
                      dismissThresholds: 0.6,
                    ),
                  ),
                ],
              ),
            ),
            // Menu Button
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            // Back button
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _takeScreenshotAndShare() async {
    try {
      final directory = (await getApplicationDocumentsDirectory()).path;
      final image = await screenshotController.captureAndSave(
        '$directory/' ,fileName: 'screenshot.png'
      );
      if (image != null) {
        // Save image to temporary directory
        
        final imagePath = '$directory/screenshot.png';
        // final imageFile = File(imagePath)..writeAsBytesSync(image);

        // Share the screenshot using shareXFiles
        Share.shareXFiles([XFile(imagePath)],
            text: 'Check out this screenshot!');
      }
    } catch (error) {
      print('Error taking screenshot: $error');
    }
  }
}
