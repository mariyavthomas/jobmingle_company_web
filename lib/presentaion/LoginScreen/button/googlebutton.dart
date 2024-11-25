import 'package:flutter/material.dart';
import 'package:job_mingle_web/infrastructure/googlerepo.dart';


class GoogleButton extends StatelessWidget {
  GoogleButton({
    super.key,
  });
 //AuthRepoGoogle google=AuthRepoGoogle();
  @override
  Widget build(BuildContext context) {
    double width1 = MediaQuery.of(context).size.width;
    double height2 = MediaQuery.of(context).size.height;
    return GestureDetector(
        onTap: () {
        // AuthRepoGoogle().signInWithGoogle(context,true);
      AuthRepoGoogle().showBottomAlertBox(context);
        
        },
        child: Container(
          height: height2 *0.08,
          width: width1 *0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:Colors.black,
          ),
          child: Center(
            child: Row(children: [
              SizedBox(
                width: width1 * 0.04,
              ),
              // SizedBox(
              //   width: width1 *0.02,
              // ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Center(
                  child: CircleAvatar(
                    minRadius:20,
                    backgroundImage:
                        AssetImage('lib/assets/image/downloadgoogleicon.png'),
                  ),
                ),
                SizedBox(
                  width: width1 *0.01,
                ),
                Center(
                  child: Text(
                    'Sign In with Google',
                    style: TextStyle(color: Colors.white,fontSize: 12),
                    //style: Theme.of(conStext).textTheme.displayLarge,
                    
                  ),
                ),
                //  CircularProgressIndicator()
              ]),
            ]),
          ),
        ));
  }
}
