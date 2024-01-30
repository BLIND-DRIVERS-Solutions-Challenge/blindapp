import 'package:blindmaps/services/voice_rec.dart';
import 'package:flutter/material.dart';

class VoiceRecognitionScreen extends StatefulWidget {
  @override
  _VoiceRecognitionScreenState createState() => _VoiceRecognitionScreenState();
}

class _VoiceRecognitionScreenState extends State<VoiceRecognitionScreen> {
  VoiceRecognitionLogic _voiceLogic = VoiceRecognitionLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voice Recognition Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_voiceLogic.text),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _voiceLogic.toggleListening,
              child: Text(_voiceLogic.isListening
                  ? 'Stop Listening'
                  : 'Start Listening'),
            ),
          ],
        ),
      ),
    );
  }
}
