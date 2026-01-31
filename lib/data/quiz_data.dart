import '../models/quiz_model.dart';

class QuizData {


// 1. Prophets in Islam
static List<Question> prophetQuestions = [
  Question(questionText: "Which Prophet was known as 'Khalilullah'?", options: ["Musa", "Ibrahim", "Isa", "Nuh"], correctAnswerIndex: 1),
  Question(questionText: "Which Prophet was swallowed by a large fish?", options: ["Yunus", "Yusuf", "Ayyub", "Yahya"], correctAnswerIndex: 0),
  Question(questionText: "To which Prophet was the Injeel revealed?", options: ["Musa", "Dawood", "Isa", "Muhammad"], correctAnswerIndex: 2),
  Question(questionText: "Which Prophet could talk to animals and controlled jinns?", options: ["Ibrahim", "Sulaiman", "Adam", "Hud"], correctAnswerIndex: 1),
  Question(questionText: "Which Prophet is known for his immense patience during illness?", options: ["Ayyub", "Yaqub", "Ismail", "Lut"], correctAnswerIndex: 0),
  Question(questionText: "Who was the first Prophet of Allah?", options: ["Nuh", "Idris", "Adam", "Sheeth"], correctAnswerIndex: 2),
  Question(questionText: "Which Prophet built the Ark?", options: ["Salih", "Nuh", "Shu'ayb", "Ibrahim"], correctAnswerIndex: 1),
  Question(questionText: "Which Prophet had the miracle of the staff turning into a snake?", options: ["Musa", "Isa", "Harun", "Ibrahim"], correctAnswerIndex: 0),
  Question(questionText: "Which Prophet was sent to the people of Thamud?", options: ["Hud", "Salih", "Lut", "Ishaq"], correctAnswerIndex: 1),
  Question(questionText: "Who was the father of Prophet Yusuf (AS)?", options: ["Ibrahim", "Ismail", "Yaqub", "Ishaq"], correctAnswerIndex: 2),
];
// 2. The Holy Quran

static List<Question> quranQuestions = [
  Question(questionText: "Which Surah is the 'Heart of the Quran'?", options: ["Al-Baqarah", "Yasin", "Al-Ikhlas", "Al-Mulk"], correctAnswerIndex: 1),
  Question(questionText: "How many Sajdah (prostrations) are in the Quran?", options: ["10", "12", "14", "15"], correctAnswerIndex: 2),
  Question(questionText: "Which Surah does not start with Bismillah?", options: ["Al-Kahf", "At-Tawbah", "An-Namal", "Al-Fatiha"], correctAnswerIndex: 1),
  Question(questionText: "Which is the shortest Surah?", options: ["Al-Asr", "Al-Ikhlas", "Al-Kawthar", "An-Nasr"], correctAnswerIndex: 2),
  Question(questionText: "In which month was the Quran first revealed?", options: ["Muharram", "Ramadan", "Rajab", "Dhul-Hijjah"], correctAnswerIndex: 1),
  Question(questionText: "Which Surah is named after a metal?", options: ["Al-Hadid", "Al-Fajr", "An-Nur", "Al-Fil"], correctAnswerIndex: 0),
  Question(questionText: "How many Juz (parts) are in the Quran?", options: ["20", "25", "30", "40"], correctAnswerIndex: 2),
  Question(questionText: "Which woman is mentioned by name in the Quran?", options: ["Khadijah", "Maryam", "Aishah", "Fatima"], correctAnswerIndex: 1),
  Question(questionText: "Which Surah is called the 'Mother of the Book'?", options: ["Al-Ikhlas", "Al-Fatiha", "Al-Baqarah", "Ayatul Kursi"], correctAnswerIndex: 1),
  Question(questionText: "What is the longest Ayah in the Quran?", options: ["Ayatul Kursi", "Ayah of Debt (2:282)", "Last Ayah of Al-Baqarah", "Ayah of Nur"], correctAnswerIndex: 1),
];
// 3. Pillars of Islam

static List<Question> pillarsQuestions = [
  Question(questionText: "How many times a day must a Muslim perform Salah?", options: ["3", "4", "5", "6"], correctAnswerIndex: 2),
  Question(questionText: "What is the minimum percentage for Zakah?", options: ["1%", "2.5%", "5%", "10%"], correctAnswerIndex: 1),
  Question(questionText: "During which pillar do Muslims go to Arafat?", options: ["Salah", "Sawm", "Hajj", "Shahadah"], correctAnswerIndex: 2),
  Question(questionText: "What is the first pillar of Islam?", options: ["Salah", "Shahadah", "Zakah", "Hajj"], correctAnswerIndex: 1),
  Question(questionText: "What is the pre-dawn meal before fasting called?", options: ["Iftar", "Suhoor", "Walima", "Aqiqah"], correctAnswerIndex: 1),
  Question(questionText: "In which direction do Muslims face for Salah?", options: ["East", "West", "The Kaaba", "Jerusalem"], correctAnswerIndex: 2),
  Question(questionText: "Which prayer is performed before sunrise?", options: ["Dhuhr", "Asr", "Maghrib", "Fajr"], correctAnswerIndex: 3),
  Question(questionText: "What breaks a fast?", options: ["Drinking water", "Sleeping", "Using perfume", "Crying"], correctAnswerIndex: 0),
  Question(questionText: "How many Rak'at are in the Fard of Isha?", options: ["2", "3", "4", "5"], correctAnswerIndex: 2),
  Question(questionText: "Zakah is obligatory on which group?", options: ["Everyone", "Children", "Wealthy Muslims", "Non-Muslims"], correctAnswerIndex: 2),
];
// 4. Islamic History

static List<Question> historyQuestions = [
  Question(questionText: "Who was the first woman to embrace Islam?", options: ["Aishah", "Fatima", "Khadijah", "Sumayyah"], correctAnswerIndex: 2),
  Question(questionText: "In which year did the Hijrah take place?", options: ["610 AD", "622 AD", "630 AD", "632 AD"], correctAnswerIndex: 1),
  Question(questionText: "Who was the first Mu'adhin (caller to prayer)?", options: ["Abu Bakr", "Umar", "Bilal ibn Rabah", "Ali"], correctAnswerIndex: 2),
  Question(questionText: "What was the first battle in Islam?", options: ["Uhud", "Badr", "Khandaq", "Khaybar"], correctAnswerIndex: 1),
  Question(questionText: "Who built the Kaaba originally?", options: ["Prophet Muhammad", "Ibrahim & Ismail", "Adam", "Musa"], correctAnswerIndex: 1),
  Question(questionText: "Which Sahabi was known as 'As-Siddiq'?", options: ["Umar", "Uthman", "Abu Bakr", "Ali"], correctAnswerIndex: 2),
  Question(questionText: "How many years did the Prophet (SAW) preach in Makkah?", options: ["10", "13", "23", "40"], correctAnswerIndex: 1),
  Question(questionText: "Who was the first martyr of Islam?", options: ["Hamza", "Sumayyah", "Yasir", "Ja'far"], correctAnswerIndex: 1),
  Question(questionText: "In which city did the Prophet (SAW) pass away?", options: ["Makkah", "Madinah", "Taif", "Jerusalem"], correctAnswerIndex: 1),
  Question(questionText: "Which Sahabi was known as 'Dhun-Nurayn'?", options: ["Ali", "Uthman", "Umar", "Khalid ibn Walid"], correctAnswerIndex: 1),
];
// 5. Hadith & Sunnah

static List<Question> hadithQuestions = [
  Question(questionText: "Which companion narrated the most Hadiths?", options: ["Aishah", "Abu Hurairah", "Ibn Umar", "Anas ibn Malik"], correctAnswerIndex: 1),
  Question(questionText: "What is a 'Sahih' Hadith?", options: ["Weak", "Authentic", "Fabricated", "Forgotten"], correctAnswerIndex: 1),
  Question(questionText: "Which book of Hadith is considered the most authentic?", options: ["Sahih Muslim", "Sahih Bukhari", "Sunan Abi Dawood", "Al-Muwatta"], correctAnswerIndex: 1),
  Question(questionText: "The Prophet (SAW) said: 'Cleanliness is half of...'?", options: ["Wealth", "Faith (Iman)", "Life", "Wisdom"], correctAnswerIndex: 1),
  Question(questionText: "What is the Sunnah?", options: ["Words of Sahaba", "Actions/Words of Prophet", "Stories of Jinns", "Dreams"], correctAnswerIndex: 1),
  Question(questionText: "How many main books of Hadith (Sihah Sittah) are there?", options: ["4", "5", "6", "10"], correctAnswerIndex: 2),
  Question(questionText: "What is 'Hadith Qudsi'?", options: ["Words of Sahaba", "Words of Allah via Prophet", "Poetry", "History"], correctAnswerIndex: 1),
  Question(questionText: "The Prophet (SAW) said: 'The best of you are those who learn the...'", options: ["Sword", "Business", "Quran", "Science"], correctAnswerIndex: 2),
  Question(questionText: "What should we say when the Prophet's name is mentioned?", options: ["SubhanAllah", "Sallallahu Alayhi Wasallam", "Alhamdulillah", "Allahu Akbar"], correctAnswerIndex: 1),
  Question(questionText: "Who compiled 'Sahih Muslim'?", options: ["Imam Muslim", "Imam Bukhari", "Imam Malik", "Imam Shafi'i"], correctAnswerIndex: 0),
];
// 6. Manners (Akhlaq)

static List<Question> akhlaqQuestions = [
  Question(questionText: "What should you say when you sneeze?", options: ["YarhamukAllah", "Alhamdulillah", "Bismillah", "Astaghfirullah"], correctAnswerIndex: 1),
  Question(questionText: "What is the reward for smiling at a brother?", options: ["Hajj", "Sadaqah (Charity)", "Zakah", "Fast"], correctAnswerIndex: 1),
  Question(questionText: "Which of these is a major sin?", options: ["Backbiting", "Sleeping", "Laughing", "Walking fast"], correctAnswerIndex: 0),
  Question(questionText: "Whose rights come first among parents?", options: ["Father", "Mother", "Grandfather", "Brother"], correctAnswerIndex: 1),
  Question(questionText: "What should you say when entering a house?", options: ["Hello", "Assalamu Alaikum", "Goodbye", "Ya Allah"], correctAnswerIndex: 1),
  Question(questionText: "What is 'Sabr'?", options: ["Anger", "Patience", "Greed", "Laziness"], correctAnswerIndex: 1),
  Question(questionText: "How should you treat your neighbors?", options: ["Ignore them", "Be kind to them", "Argue with them", "Ask for money"], correctAnswerIndex: 1),
  Question(questionText: "What is 'Tawakkul'?", options: ["Hard work", "Trust in Allah", "Giving money", "Traveling"], correctAnswerIndex: 1),
  Question(questionText: "Is telling a 'small' lie allowed in Islam?", options: ["Yes", "Only on Fridays", "No", "Only if funny"], correctAnswerIndex: 2),
  Question(questionText: "The Prophet (SAW) was known as 'Al-Amin', which means...?", options: ["The Strong", "The Trustworthy", "The Fast", "The Brave"], correctAnswerIndex: 1),
];
// 7. Dua & Remembrance

static List<Question> duaQuestions = [
  Question(questionText: "What do we say before eating?", options: ["Alhamdulillah", "Bismillah", "Allahu Akbar", "SubhanAllah"], correctAnswerIndex: 1),
  Question(questionText: "What do we say after finishing a meal?", options: ["Bismillah", "Alhamdulillah", "MashaAllah", "Astaghfirullah"], correctAnswerIndex: 1),
  Question(questionText: "Which phrase means 'Glory be to Allah'?", options: ["SubhanAllah", "Alhamdulillah", "Allahu Akbar", "La ilaha illallah"], correctAnswerIndex: 0),
  Question(questionText: "What is 'Istighfar'?", options: ["Praising Allah", "Seeking forgiveness", "Going to Hajj", "Praying"], correctAnswerIndex: 1),
  Question(questionText: "What do we say when we see something beautiful?", options: ["Alhamdulillah", "MashaAllah", "SubhanAllah", "Astaghfirullah"], correctAnswerIndex: 1),
  Question(questionText: "Which Dua is recited for protection from Dajjal?", options: ["First 10 verses of Kahf", "Surah Nas", "Surah Falaq", "Surah Ikhlas"], correctAnswerIndex: 0),
  Question(questionText: "What is 'Dhikr'?", options: ["Sleeping", "Remembrance of Allah", "Eating", "Running"], correctAnswerIndex: 1),
  Question(questionText: "What do we say when leaving the house?", options: ["Bismillah tawakkaltu 'ala Allah", "Alhamdulillah", "Allahu Akbar", "SubhanAllah"], correctAnswerIndex: 0),
  Question(questionText: "Which phrase is 'The Weighty Word on the Scales'?", options: ["Alhamdulillah", "SubhanAllahi wa bihamdihi", "Allahu Akbar", "Bismillah"], correctAnswerIndex: 1),
  Question(questionText: "What do we say to a person who does us a favor?", options: ["Thank you", "JazakAllah Khayr", "MashaAllah", "Good job"], correctAnswerIndex: 1),
];
// 8. General Islamic Knowledge
static List<Question> generalQuestions = [
  Question(questionText: "Where is the largest Masjid in the world?", options: ["Madinah", "Makkah", "Jerusalem", "Istanbul"], correctAnswerIndex: 1),
  Question(questionText: "What is the Islamic calendar called?", options: ["Solar", "Gregorian", "Hijri", "Lunar"], correctAnswerIndex: 2),
  Question(questionText: "On which day is Friday prayer performed?", options: ["Saturday", "Thursday", "Jumu'ah", "Monday"], correctAnswerIndex: 2),
  Question(questionText: "What is the name of the well in Makkah?", options: ["Zamzam", "Al-Kawthar", "Tasnim", "Salsabil"], correctAnswerIndex: 0),
  Question(questionText: "What are the two Eids in Islam?", options: ["Eid al-Fitr & Eid al-Adha", "Eid al-Fitr & Ramadan", "Hajj & Eid", "Muharram & Eid"], correctAnswerIndex: 0),
  Question(questionText: "How many angels are mentioned in the Quran?", options: ["Only 1", "Dozens", "Billions", "Several specific ones"], correctAnswerIndex: 3),
  Question(questionText: "What is the bridge over Hellfire called?", options: ["Mizan", "Sirat", "Kawthar", "Sidratul Muntaha"], correctAnswerIndex: 1),
  Question(questionText: "What is the animal used during Eid al-Adha sacrifice?", options: ["Bird", "Fish", "Livestock (Sheep/Cow/Camel)", "Horse"], correctAnswerIndex: 2),
  Question(questionText: "What is the language of the Quran?", options: ["Urdu", "Persian", "Arabic", "Turkish"], correctAnswerIndex: 2),
  Question(questionText: "Who is the leader of the Angels?", options: ["Mikail", "Israfil", "Jibril", "Malik"], correctAnswerIndex: 2),
];
}