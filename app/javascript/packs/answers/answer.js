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


  var onBeforeunloadHandler = function(e) {
    e.returnValue = 'ちょっと待ってくださいよ。まだダメですよ。';
  };
  // イベントを登録
  window.addEventListener('beforeunload', onBeforeunloadHandler, false);

  // 変数formにform_withの内容を取得(htmlcollectionにて)
  var form = document.getElementById('form_id');

  // formの中のsubmitイベントを追加
  form.addEventListener('submit', function(e) {
    // イベントを削除
    window.removeEventListener('beforeunload', onBeforeunloadHandler, false);
  }, false);


  // これ以降はクイズ回答中にヘッダーで遷移を試みた場合に警告文イベントを削除
  var reload_1 = document.getElementById('reload_of_1');
  // formの中のsubmitイベントを追加
  reload_1.addEventListener('click', function(e) {
        // イベントを削除(リロード警告)
    window.removeEventListener('beforeunload', onBeforeunloadHandler, false);
  }, false);

  var reload_2 = document.getElementById('reload_of_2');
  // formの中のsubmitイベントを追加
  reload_2.addEventListener('click', function(e) {
        // イベントを削除(リロード警告)
    window.removeEventListener('beforeunload', onBeforeunloadHandler, false);
  }, false);

  var reload_3 = document.getElementById('reload_of_3');
  // formの中のsubmitイベントを追加
  reload_3.addEventListener('click', function(e) {
        // イベントを削除(リロード警告)
    window.removeEventListener('beforeunload', onBeforeunloadHandler, false);
  }, false);

  var reload_4 = document.getElementById('reload_of_4');
  // formの中のsubmitイベントを追加
  reload_4.addEventListener('click', function(e) {
        // イベントを削除(リロード警告)
    window.removeEventListener('beforeunload', onBeforeunloadHandler, false);
  }, false);
