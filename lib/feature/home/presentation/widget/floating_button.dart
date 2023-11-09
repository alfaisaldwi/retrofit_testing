
import 'package:flutter/material.dart';
import 'package:retrof/feature/form/presentation/form.dart';

class floatingButton extends StatelessWidget {
  const floatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormView(),
          )),
    );
  }
}
