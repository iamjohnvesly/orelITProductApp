import 'package:flutter/material.dart';

import '../theme/base_color.dart';

class ButtonFilled extends StatelessWidget {
  final String lable;
  final VoidCallback? action;
  final bool loading;
  const ButtonFilled({
    Key? key,
    required this.lable,
    required this.action,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.0,
      child: ElevatedButton(
        onPressed: loading ? null : action,
        style: ElevatedButton.styleFrom(
            backgroundColor: BaseColorTheme.defaultColor[500]),
        child: loading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      lable,
                      style: const TextStyle(
                          color: Colors.white, letterSpacing: 2.0),
                    ),
                  ),
                ],
              )
            : Text(
                lable,
                style: const TextStyle(color: Colors.white, letterSpacing: 2.0),
              ),
      ),
    );
  }
}
