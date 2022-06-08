  var a = "";

  var target = document.getElementById('first_question');
  　target.addEventListener('click', event);

  function event() {
    const last_child_element = target.lastElementChild;
    const correct_answer = last_child_element.value;

    console.log(JSON.stringify(correct_answer))
    a = a + "|" + correct_answer

    console.log(a);

    document.getElementById('post_answer').value = a;
  };

  var second_target = document.getElementById('second_question');
  　second_target.addEventListener('click', second_event);

  function second_event() {
    const last_child_element = second_target.lastElementChild;
    const correct_answer = last_child_element.value;

    console.log(JSON.stringify(correct_answer))
    a = a + "|" + correct_answer

    console.log(a);

    document.getElementById('post_answer').value = a;
  };

  var third_target = document.getElementById('third_question');
  　third_target.addEventListener('click', third_event);

  function third_event() {
    const last_child_element = third_target.lastElementChild;
    const correct_answer = last_child_element.value;

    console.log(JSON.stringify(correct_answer))
    a = a + "|" + correct_answer

    console.log(a);

    document.getElementById('post_answer').value = a;
  };
