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
