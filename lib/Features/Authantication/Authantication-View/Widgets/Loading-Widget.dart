import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-Controller/Check-Authantication.dart';
import 'package:fashion_e_commerce_mobile_app/main_navigation.dart';
import 'package:flutter/material.dart';



class Loading extends StatefulWidget {
  final String when_loading;
  final String User_Name;
  final String Password;
  const Loading({super.key,required this.Password,required this.User_Name,required this.when_loading});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  API_LOGIN ApiData = API_LOGIN();

  Future<void> _handleLogin(String UserName, String Password) async {

    final Token = await ApiData.loginUser(UserName,Password);

    Future.delayed(const Duration(seconds: 2),()
    {
      if(Token != "" || Token.isEmpty)
      {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (Features) => const main_navigation()),
                (route) => false);
      }
    });

  }


  @override
  void initState() {
    super.initState();
    if(widget.when_loading == "login")
    {
      _handleLogin(widget.User_Name.toString(), widget.Password.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: White,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white54,
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  )
                ]),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.white54,
              color: Primary,
            ),
          ),
        ),
      ),
    );
  }
}
