class ExamQuestion {
  final String subjectCode;
  final String question;
  final String type;
  const ExamQuestion({required this.subjectCode, required this.question, required this.type});
}

const importantQuestions = <ExamQuestion>[
  ExamQuestion(subjectCode: 'ICT', type: 'Long question', question: 'Explain the generations of computers and compare their main technologies.'),
  ExamQuestion(subjectCode: 'ICT', type: 'Short question', question: 'Differentiate between data and information with examples.'),
  ExamQuestion(subjectCode: 'ICT', type: 'Short question', question: 'Define computer hardware and software.'),
  ExamQuestion(subjectCode: 'PF', type: 'Long question', question: 'Explain the four pillars of computational thinking.'),
  ExamQuestion(subjectCode: 'PF', type: 'Problem solving', question: 'Write an algorithm and flowchart for checking whether a number is even or odd.'),
  ExamQuestion(subjectCode: 'PF', type: 'Short question', question: 'What are variables and data types in C++?'),
  ExamQuestion(subjectCode: 'FE', type: 'Writing', question: 'Write an expository paragraph with a clear topic sentence, supporting details, and conclusion.'),
  ExamQuestion(subjectCode: 'FA', type: 'Long question', question: 'Explain accounting, financial statements, and the accounting cycle.'),
  ExamQuestion(subjectCode: 'QURAN', type: 'Review required', question: 'Important questions will be added after a readable Quran notes scan is available.'),
  ExamQuestion(subjectCode: 'HISTORY', type: 'Review required', question: 'History questions will be added when the Semester 1 History notes or past papers are received.'),
  ExamQuestion(subjectCode: 'PAK', type: 'Review required', question: 'Pakistan Studies questions will be added when the relevant course notes are received.'),
  ExamQuestion(subjectCode: 'DA', type: 'Review required', question: 'Digital Arts questions will be added when the relevant course notes are received.'),
];

class PracticeMcq {
  final String subjectCode;
  final String question;
  final List<String> options;
  final int answerIndex;
  final String explanation;
  const PracticeMcq({required this.subjectCode, required this.question, required this.options, required this.answerIndex, required this.explanation});
}

const practiceMcqs = <PracticeMcq>[
  PracticeMcq(subjectCode: 'PF', question: 'Which pillar breaks a complex problem into smaller parts?', options: ['Abstraction', 'Decomposition', 'Pattern recognition', 'Debugging'], answerIndex: 1, explanation: 'Decomposition divides a large problem into manageable sub-problems.'),
  PracticeMcq(subjectCode: 'PF', question: 'Which data type commonly stores a whole number?', options: ['int', 'string', 'bool', 'char[]'], answerIndex: 0, explanation: 'In C/C++, int is used for whole-number values.'),
  PracticeMcq(subjectCode: 'PF', question: 'What is an algorithm?', options: ['A computer brand', 'A step-by-step solution', 'A storage device', 'A programming error'], answerIndex: 1, explanation: 'An algorithm is a finite, logical sequence of steps.'),
  PracticeMcq(subjectCode: 'ICT', question: 'Raw facts and figures are called:', options: ['Information', 'Data', 'Knowledge', 'Software'], answerIndex: 1, explanation: 'Data is raw input; processed and meaningful data becomes information.'),
  PracticeMcq(subjectCode: 'ICT', question: 'Which device is used to connect computers in a star network?', options: ['Hub or switch', 'Printer', 'Scanner', 'Keyboard'], answerIndex: 0, explanation: 'A central hub or switch connects devices in a star topology.'),
  PracticeMcq(subjectCode: 'ICT', question: 'Which part of a computer executes instructions?', options: ['Monitor', 'CPU', 'Mouse', 'Speaker'], answerIndex: 1, explanation: 'The CPU processes instructions and controls computer operations.'),
  PracticeMcq(subjectCode: 'FE', question: 'The word “beside” means:', options: ['Far from', 'Next to', 'Inside', 'Before'], answerIndex: 1, explanation: 'Beside means next to or at the side of something.'),
  PracticeMcq(subjectCode: 'FE', question: 'An expository paragraph mainly:', options: ['Explains a topic', 'Tells only jokes', 'Lists random words', 'Uses no evidence'], answerIndex: 0, explanation: 'Expository writing explains a topic with clear details and examples.'),
  PracticeMcq(subjectCode: 'FE', question: 'A topic sentence usually gives the paragraph’s:', options: ['Main idea', 'Last spelling', 'Page number', 'Question count'], answerIndex: 0, explanation: 'The topic sentence introduces the central idea of a paragraph.'),
  PracticeMcq(subjectCode: 'FA', question: 'The basic accounting equation is:', options: ['Assets = Liabilities + Capital', 'Assets = Sales − Expense', 'Capital = Assets + Liabilities', 'Profit = Assets + Drawings'], answerIndex: 0, explanation: 'The accounting equation is Assets = Liabilities + Capital.'),
  PracticeMcq(subjectCode: 'FA', question: 'A trial balance is prepared mainly to check:', options: ['Equal debit and credit totals', 'Employee attendance', 'Market prices', 'Bank holidays'], answerIndex: 0, explanation: 'A trial balance checks the arithmetical equality of ledger debit and credit balances.'),
  PracticeMcq(subjectCode: 'FA', question: 'Which account is normally debited when a business buys equipment for cash?', options: ['Equipment', 'Capital', 'Sales', 'Creditor'], answerIndex: 0, explanation: 'Equipment increases and is debited; cash decreases and is credited.'),
  PracticeMcq(subjectCode: 'HISTORY', question: 'The conquest of Sindh is associated with:', options: ['Muhammad bin Qasim', 'Akbar', 'Aurangzeb', 'Sher Shah Suri'], answerIndex: 0, explanation: 'Muhammad bin Qasim conquered Sindh in 711 CE.'),
  PracticeMcq(subjectCode: 'QURAN', question: 'Sabr means:', options: ['Patience', 'Trade', 'Travel', 'Wealth'], answerIndex: 0, explanation: 'Sabr means patience and steadfastness.'),
];

List<PracticeMcq> mcqsForSubject(String subjectCode) => practiceMcqs.where((item) => item.subjectCode == subjectCode).toList();

List<PracticeMcq> flashcardsForSubject(String subjectCode) => mcqsForSubject(subjectCode);
