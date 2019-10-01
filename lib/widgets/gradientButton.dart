import 'package:flutter/material.dart';
class GradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradientInner;
  final Gradient gradientBorder;
  final Color colorInner;
  final Color colorBorder;
  final double width;
  final double height;
  final Function onPressed;
  final isEnabled;
  final borderRadius = BorderRadius.circular(128.0);

GradientButton({
    Key key,
    @required this.child,
    
    this.width = double.infinity,
    this.height =0,
    this.onPressed,
    this.isEnabled = true,
    this.gradientInner,
    this.gradientBorder,
    this.colorInner,
    this.colorBorder,
  });
  void doNothing(){

  }

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    if (isEnabled != null) {
      // Show gradient color by making material widget transparent
      if (isEnabled == true) {
        _statusColor = Colors.transparent;
      } else {
        // Show grey color if isEnabled is false
        _statusColor = Color.fromRGBO(200, 200,200, 0.1);
      }
    } else {
      // Show grey color if isEnabled is null
      _statusColor = Colors.transparent;
    }

    return Container(
       decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient:(isEnabled==false)? LinearGradient(
                    colors: <Color>[
                      
                      _statusColor,
                      _statusColor
                    ],
                  ):(gradientBorder==null)?
            (gradientInner==null)?LinearGradient(
                    colors: <Color>[
                      
                      colorBorder,
                      colorBorder
                    ],
                  ):gradientInner:gradientBorder
          ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient:(isEnabled==false)? LinearGradient(
                    colors: <Color>[
                      
                      _statusColor,
                      _statusColor
                    ],
                  ):(gradientInner==null)?LinearGradient(
                    colors: <Color>[
                      
                      colorInner,
                      colorInner
                    ],
                  ):gradientInner
          ),
          child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius:borderRadius),
              color: _statusColor,
              child: InkWell(

                  borderRadius: borderRadius,
                  onTap: (isEnabled)?onPressed:doNothing,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Center(
                      child: child,
                    ),
                  ))),
        ),
      ),
    );
  }

   static GradientButton getLightGradiantButton(BuildContext context,Function onPressed, String text, Color fontColor, double fontSize,bool isEnabled){
     return new GradientButton(
       isEnabled: isEnabled,
                   colorInner: Colors.black,
                   gradientInner:  LinearGradient(
                    colors: <Color>[                      
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColor
                    ],
                  ),
                   gradientBorder: LinearGradient(
                    colors: <Color>[                      
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColor
                    ],
                  ),
              
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: fontSize),
                  ),
                );
  }
   static GradientButton getDarkGradiantButton(BuildContext context,Function onPressed, String text, Color fontColor, double fontSize,bool isEnabled){
     return new GradientButton(
                    isEnabled: isEnabled,
                   colorInner: Colors.black,
                   gradientInner:  LinearGradient(
                    colors: <Color>[                      
                      Colors.white,
                      Colors.grey
                    ],
                  ),
                   gradientBorder: LinearGradient(
                    colors: <Color>[                      
                      Theme.of(context).accentColor,
                      Theme.of(context).primaryColor
                    ],
                  ),
              
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.black, fontSize: fontSize),
                  ),
                );
  }

  static GradientButton getGradiantButton(BuildContext context,Function onPressed, String text, Color fontColor, double fontSize,bool isEnabled){
    if(Theme.of(context).brightness==Brightness.light){
      return getLightGradiantButton(context, onPressed, text, Colors.black, 20,isEnabled);
    }
    else{
       return getDarkGradiantButton(context, onPressed, text, Colors.black, 20,isEnabled);
    }
  }
}