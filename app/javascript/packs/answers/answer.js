  // document.getElementById('answeraa').value = "[]";

  var a = [];

  var target = document.getElementById('first_question');
  　target.addEventListener('click', event);

  function event() {
    const last_child_element = target.lastElementChild;
    const correct_answer = last_child_element.value;
    a.push(correct_answer);
    document.getElementById('answer').value = a;
  };

// 　var target = document.getElementById("second_question");
// 　target.addEventListener('click', event);

// 　function event() {
// 　   document.getElementById("answer").value = 123
// 　};

// 　var target = document.getElementById("third_question");
// 　target.addEventListener('click', event);

// 　function event() {
// 　   document.getElementById("answer").value = 123
// 　};