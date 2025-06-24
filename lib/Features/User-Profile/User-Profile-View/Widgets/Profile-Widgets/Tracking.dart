import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Pages/Second-Pages/Tracking-Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: ()
        {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const TrackingScreen(),),);
        },
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 1,
              color: Colors.grey.shade300,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: SvgPicture.asset("assets/Icon_SVG/shipping.svg",color: Colors.grey.shade400,width: 25,),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 8),
                  child: Text(
                    "Order Tracking",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith( fontSize: 20,color: Colors.black),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(
                    Icons.chevron_right,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
