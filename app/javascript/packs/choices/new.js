var quiz = document.getElementById('quiz_id').value;
var question = document.getElementById('question_id').value;
history.replaceState('', '', `/admin/quizzes/${quiz}/questions/${question}/choices/new`)
