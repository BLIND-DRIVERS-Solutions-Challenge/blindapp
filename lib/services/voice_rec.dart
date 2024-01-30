import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceRecognitionLogic {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and start speaking';

  bool get isListening => _isListening;
  String get text => _text;

  void toggleListening() {
    if (_isListening) {
      _stopListening();
    } else {
      _startListening();
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Listening status: $status');
      },
      onError: (error) {
        print('Error: $error');
      },
    );

    if (available) {
      _speech.listen(
        onResult: (result) {
          _updateText(result.recognizedWords);
        },
      );
      _updateListening(true);
    } else {
      print('Speech recognition not available');
    }
  }

  void _stopListening() {
    _speech.stop();
    _updateListening(false);
  }

  void _updateText(String newText) {
    _text = newText;
  }

  void _updateListening(bool isListening) {
    _isListening = isListening;
  }
}
