import 'package:url_launcher/url_launcher.dart';

class Comman{
   void makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    // ignore: deprecated_member_use
    if (await canLaunch(phoneUri.toString())) {
      // ignore: deprecated_member_use
      await launch(phoneUri.toString());
    } else {
      throw 'Could not launch $phoneUri';
    }
  }

  void sendEmail(String emailAddress) {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
      query:
          'subject=Hello&body=I would like to get in touch with you', // Optional parameters
    );

    // ignore: unnecessary_null_comparison
    if (canLaunchUrl(emailUri) != null) {
      launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}