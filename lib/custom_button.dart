import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonlable;
  final void Function()? onbuttonPressed;
  final IconData? buttonIcon;
  const CustomButton({super.key, required this.buttonlable, this.onbuttonPressed,this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: onbuttonPressed,
          child: Container(
            height: 50,
            width: 180,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                buttonIcon,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                size: 18,
              ),
              Text(
                buttonlable,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )
              )
            ],
           ),
          ),
         );
  }
}