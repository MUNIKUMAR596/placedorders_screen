import 'package:flutter/material.dart';

class AutoDialogScreen extends StatefulWidget {
  const AutoDialogScreen({super.key});

  @override
  State<AutoDialogScreen> createState() => _AutoDialogScreenState();
}

class _AutoDialogScreenState extends State<AutoDialogScreen> {
  @override
  void initState() {
    super.initState();

    // Run after first build
    Future.delayed(Duration.zero, () {
      _showLoaderThenDialog();
    });
  }

  void _showLoaderThenDialog() async {
    // Show loading spinner
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    // Wait 2 seconds
    await Future.delayed(const Duration(seconds: 2));

    // Close the loader
    if (context.mounted) Navigator.of(context).pop();

    // Show your custom blue dialog
    if (context.mounted) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Empty Folder',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Screen Loaded')),
    );
  }
}
