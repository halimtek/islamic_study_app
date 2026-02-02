import 'package:flutter/material.dart';
import '../models/quiz_model.dart';
import 'quiz_results_screen.dart';
import 'dart:async';

class QuestionScreen extends StatefulWidget {
  final List<Question> questions;
  final String categoryName;

  const QuestionScreen({
    super.key,
    required this.questions,
    required this.categoryName,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  // --- HalimTek Consistency Constants ---
  final Color accentTeal = const Color(0xFF26A69A);
  final Color darkCard = const Color(0xFF132521);
  final Color deepDark = const Color(0xFF0A1A16);

  int _secondsRemaining = 15;
  Timer? _timer;
  int _currentIndex = 0;
  int? _selectedIndex;
  bool _isAnswered = false;
  int _score = 0;
  late DateTime _startTime;

  @override
  void initState() {
    super.initState();
    _startTime = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 15;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          _onTimeUp();
        }
      });
    });
  }

  void _onTimeUp() => _handleAnswer(-1);

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _handleAnswer(int index) {
    if (_isAnswered) return;
    _timer?.cancel(); 
    setState(() {
      _selectedIndex = index;
      _isAnswered = true;
      if (index == widget.questions[_currentIndex].correctAnswerIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < widget.questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedIndex = null;
        _isAnswered = false;
      });
      _startTimer();
    } else {
      DateTime endTime = DateTime.now();
      Duration timeTaken = endTime.difference(_startTime);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultsScreen(
            score: _score,
            totalQuestions: widget.questions.length,
            categoryName: widget.categoryName,
            questions: widget.questions,
            duration: timeTaken,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.questions[_currentIndex];
    final double progress = (_currentIndex + 1) / widget.questions.length;

    return Scaffold(
      backgroundColor: deepDark,
      body: Stack(
        children: [
          CustomPaint(size: Size.infinite, painter: CrossPatternPainter()),
          SafeArea(
            child: Column(
              children: [
                _buildTopNavigation(),
                _buildHeaderInfo(progress),
                
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildQuestionCard(currentQuestion.questionText),
                        const SizedBox(height: 35),
                        ...List.generate(currentQuestion.options.length, (index) {
                          return _buildOptionCard(
                            index: index,
                            text: currentQuestion.options[index],
                            correctIndex: currentQuestion.correctAnswerIndex,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                _buildBottomAction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- UI Components ---

  Widget _buildTopNavigation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white70),
          ),
          _buildTimerCircle(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderInfo(double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "QUESTION ${_currentIndex + 1}/${widget.questions.length}",
                style: TextStyle(color: accentTeal, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1),
              ),
              Text(
                widget.categoryName,
                style: const TextStyle(color: Colors.white54, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.white.withOpacity(0.05),
              valueColor: AlwaysStoppedAnimation(accentTeal),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimerCircle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _secondsRemaining <= 5 ? Colors.redAccent.withOpacity(0.5) : accentTeal.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, color: _secondsRemaining <= 5 ? Colors.redAccent : accentTeal, size: 16),
          const SizedBox(width: 6),
          Text(
            "00:${_secondsRemaining.toString().padLeft(2, '0')}",
            style: TextStyle(
              color: _secondsRemaining <= 5 ? Colors.redAccent : Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0D4D3B), Color(0xFF082D24)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10))
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.4),
      ),
    );
  }

  Widget _buildOptionCard({required int index, required String text, required int correctIndex}) {
    bool isSelected = _selectedIndex == index;
    bool showResult = _isAnswered;
    bool isCorrect = index == correctIndex;

    Color cardBorder = Colors.white10;
    Color iconBg = Colors.white.withOpacity(0.05);
    Color textColor = Colors.white70;

    if (showResult) {
      if (isCorrect) {
        cardBorder = accentTeal;
        iconBg = accentTeal.withOpacity(0.2);
        textColor = Colors.white;
      } else if (isSelected && !isCorrect) {
        cardBorder = Colors.redAccent;
        iconBg = Colors.redAccent.withOpacity(0.2);
      }
    } else if (isSelected) {
      cardBorder = accentTeal;
      iconBg = accentTeal.withOpacity(0.1);
      textColor = Colors.white;
    }

    return GestureDetector(
      onTap: () => _handleAnswer(index),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: darkCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: cardBorder, width: 2),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: iconBg,
              child: Text(
                String.fromCharCode(65 + index),
                style: TextStyle(
                  color: (isSelected || (showResult && isCorrect)) ? accentTeal : Colors.white24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            if (showResult && isCorrect)
              Icon(Icons.check_circle, color: accentTeal, size: 22),
            if (showResult && isSelected && !isCorrect)
              const Icon(Icons.cancel, color: Colors.redAccent, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAction() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 35),
      decoration: BoxDecoration(
        color: darkCard,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
        border: const Border(top: BorderSide(color: Colors.white10, width: 0.5)),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 58,
        child: ElevatedButton(
          onPressed: _isAnswered ? _nextQuestion : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: accentTeal,
            disabledBackgroundColor: Colors.white.withOpacity(0.05),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            elevation: 0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentIndex == widget.questions.length - 1 ? "FINISH QUIZ" : "NEXT QUESTION",
                style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w900, letterSpacing: 1),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward, color: Colors.black, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class CrossPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.02)
      ..strokeWidth = 1;
    for (double i = 0; i < size.width; i += 30) {
      for (double j = 0; j < size.height; j += 30) {
        canvas.drawLine(Offset(i - 2, j), Offset(i + 2, j), paint);
        canvas.drawLine(Offset(i, j - 2), Offset(i, j + 2), paint);
      }
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}