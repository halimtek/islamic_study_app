import 'package:flutter/material.dart';
import 'package:islamic_study_app/screens/question_screen.dart';
import 'package:islamic_study_app/models/quiz_model.dart';

class QuizResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String categoryName;
  final List<Question> questions;
  final Duration? duration;

  const QuizResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.categoryName,
    required this.questions,
    required this.duration,
  });

  // Brand Colors for Consistency
  final Color accentTeal = const Color(0xFF26A69A);
  final Color darkCard = const Color(0xFF132521);
  final Color deepDark = const Color(0xFF0A1A16);

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String _getFeedbackMessage(int percentage) {
    if (percentage >= 80) return "MashaAllah!";
    if (percentage >= 50) return "Well Done!";
    return "Keep Learning!";
  }

  String _getSubtitleMessage(int percentage) {
    if (percentage >= 80) return "You mastered this topic beautifully.";
    if (percentage >= 50) return "You're doing great! Just a bit more practice.";
    return "Don't give up! Knowledge is a journey.";
  }

  @override
  Widget build(BuildContext context) {
    double accuracy = score / totalQuestions;
    int percentage = (accuracy * 100).toInt();
    int incorrect = totalQuestions - score;

    return Scaffold(
      backgroundColor: deepDark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white70),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.white70),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    categoryName.toUpperCase(),
                    style: TextStyle(color: accentTeal, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 2),
                  ),
                  const SizedBox(height: 30),
                  
                  // Accuracy Gauge
                  _buildAccuracyGauge(accuracy, percentage),
                  
                  const SizedBox(height: 40),
                  Text(
                    _getFeedbackMessage(percentage),
                    style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getSubtitleMessage(percentage),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white38, fontSize: 15, height: 1.4),
                  ),
                  
                  const SizedBox(height: 40),

                  // Stats Grid
                  Row(
                    children: [
                      _buildStatCard("CORRECT", "$score", Icons.check_circle_outline, accentTeal),
                      const SizedBox(width: 16),
                      _buildStatCard("WRONG", "$incorrect", Icons.cancel_outlined, Colors.redAccent),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _buildStatCard("TIME", _formatDuration(duration ?? Duration.zero), Icons.timer_outlined, Colors.blueAccent),
                      const SizedBox(width: 16),
                      _buildStatCard("XP EARNED", "+${score * 10}", Icons.bolt, Colors.amber),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom Action Section
          _buildBottomSection(percentage, context),
        ],
      ),
    );
  }

  Widget _buildAccuracyGauge(double value, int percent) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 15,
            strokeCap: StrokeCap.round,
            backgroundColor: Colors.white.withOpacity(0.05),
            valueColor: AlwaysStoppedAnimation<Color>(accentTeal),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$percent%",
              style: const TextStyle(color: Colors.white, fontSize: 54, fontWeight: FontWeight.w900),
            ),
            const Text(
              "ACCURACY",
              style: TextStyle(color: Colors.white24, fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: darkCard,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 15),
            Text(
              label,
              style: const TextStyle(color: Colors.white24, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              value,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(int percentage, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 30, 24, 40),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        border: const Border(top: BorderSide(color: Colors.white10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Topic Mastery", style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
              Text("$percentage%", style: TextStyle(color: accentTeal, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 15),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage / 100,
              minHeight: 8,
              backgroundColor: Colors.white.withOpacity(0.05),
              valueColor: AlwaysStoppedAnimation<Color>(accentTeal),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              // Back to Home
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white10),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                  ),
                  child: const Text("Home", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 15),
              // Play Again
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionScreen(
                          categoryName: categoryName,
                          questions: questions,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentTeal,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Try Again",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}