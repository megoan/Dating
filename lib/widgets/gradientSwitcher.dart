import 'package:flutter/material.dart';
class GradientSwitcher extends StatelessWidget {
  final Widget child;
  final Gradient gradientBorder;
  final Color colorBorder;
  final double width;
  final double height;
  final Function onPressed;
  final isEnabled;
  final borderRadius = BorderRadius.circular(128.0);

GradientSwitcher({
    Key key,
    @required this.child,
    this.width = double.infinity,
    this.height =0,
    this.onPressed,
    this.isEnabled = true,
    this.gradientBorder,
    this.colorBorder,
  }); 

  @override
  Widget build(BuildContext context) {
    Color _statusColor;
    if (isEnabled != null) {
      // Show gradient color by making material widget transparent
      if (isEnabled == true) {
        _statusColor = Colors.transparent;
      } else {
        // Show grey color if isEnabled is false
        _statusColor = Color.fromRGBO(200, 200, 200, 0.5);
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
                      _statusColor,
                     
                    ],
                  ):(gradientBorder==null)?
           LinearGradient(
                    colors: <Color>[
                      
                      colorBorder,
                      colorBorder
                    ],
                  ):gradientBorder
          ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: LinearGradient(
                    colors: <Color>[
                      
                      Theme.of(context).scaffoldBackgroundColor,
                      Theme.of(context).scaffoldBackgroundColor,
                    ],
                  )
          ),
          child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius:borderRadius),
              color:  Colors.transparent,
              child: InkWell(

                  borderRadius: borderRadius,
                  onTap: onPressed,
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

   static GradientSwitcher getLightGradiantButton(BuildContext context,Function onPressed, String text, Color fontColor, double fontSize,bool isEnabled){
     return new GradientSwitcher(
       isEnabled: isEnabled,
        
                   gradientBorder: LinearGradient(
                    colors: <Color>[                      
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor
                    ],
                  ),
              
                  onPressed: onPressed,
                  child: FittedBox(fit:BoxFit.fitWidth, 
    child:  Text(
                    text,
                    style: TextStyle(color:(isEnabled)? fontColor:Color.fromRGBO(100, 100, 100, 0.5), fontSize: fontSize),
                  ),
                ));
  }
   static GradientSwitcher getDarkGradiantButton(BuildContext context,Function onPressed, String text,Color fontColor,double fontSize,bool isEnabled){
     return new GradientSwitcher(
                    isEnabled: isEnabled,

                   gradientBorder: LinearGradient(
                    colors: <Color>[                      
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColor
                    ],
                  ),
              
                  onPressed: onPressed,
                  child:  FittedBox(fit:BoxFit.fitWidth, 
    child: Text(
                    text,
                    style: TextStyle(color:(isEnabled)? fontColor:Color.fromRGBO(200, 200, 200, 0.5), fontSize: fontSize),
                  ),
                ));
  }

  static GradientSwitcher getGradiantButton(BuildContext context,Function onPressed, String text, double fontSize,bool isEnabled){
    if(Theme.of(context).brightness==Brightness.light){
      return getLightGradiantButton(context, onPressed, text, Theme.of(context).primaryColor, 20,isEnabled);
    }
    else{
       return getDarkGradiantButton(context, onPressed, text, Theme.of(context).primaryColor, 20,isEnabled);
    }
  }
}