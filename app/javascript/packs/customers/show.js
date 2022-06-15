const ctx = document.getElementById('myChart');
const answer1 = document.getElementById('answer1').value;
const answer2 = document.getElementById('answer2').value;
const answer3 = document.getElementById('answer3').value;
const answer4 = document.getElementById('answer4').value;

var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['３回前', '２回前', '１回前', '最新'],
        datasets: [{
            label: '# of Votes',
            data: [answer4, answer3, answer2, answer1],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});