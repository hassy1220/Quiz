const ctx = document.getElementById('myChart');
const sample1 = document.getElementById('answer');
sample1.onclick = () => {
    //２度押し防止の実装
    sample1.disabled = true;
    const answer1 = document.getElementById('answer1').value
    const answer2 = document.getElementById('answer2').value
    const answer3 = document.getElementById('answer3').value
};
