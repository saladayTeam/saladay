//options chart.js사이트가서 확인
//labels에 자바스크립트 객체 변환한 데이터를 넣어줌

const ctx = document.getElementById('myChart1').getContext('2d');
const myChart1 = new Chart(ctx, {
    //최상단 그래프 2개 중 bar 그래프
    type: 'bar',
    plugins: [ChartDataLabels],
    data: {
        labels: month,
        plugins: [ChartDataLabels],
        datasets: [{
            label: '월간 매출액',
            data: monthOrderPrice,
            backgroundColor: [
                '#17633d93'
            ],
            borderColor: [
                'white'
            ],
            borderWidth: 1,
            hoverOffset: 4
        },
        {
            label: '월간 주문 건수',
            data: monthOrderCount,
            borderColor: 'orange',
            //최상단 그래프 2개 중 line 그래프
            type:'line',
            tension:0.1,
            fill: true,
            // order:0
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        plugins: {
            legend: {
            position: 'top',
            datalabels: {
                color: 'black'
            }
            },
    },
    
}
});

const ctx2 = document.getElementById('myChart2').getContext('2d');
const myChart2 = new Chart(ctx2, {
    type: 'pie',
    plugins: [ChartDataLabels],
    data: {
        //대시보드jsp하단 객체를 통해 받아온 값
        labels: packageNameList,
        datasets: [{
            label: '주문 건수',
            data: packageOrderCount,
            backgroundColor: [
                '#f1828d',
                '#848ccf',
                '#252958',
                '#f9b42d',
                '#3498db',
                '#ff4c30'
            ],
            borderColor: [
                'white'
            ],
            borderWidth: 1,
            hoverOffset: 4
        }]
    },
    options: {
        
        plugins: {
            legend: {
            position: 'bottom',
            datalabels: {
                color: 'black'
                }
            },
    },
}
});

const ctx3 = document.getElementById('myChart3').getContext('2d');
const myChart3 = new Chart(ctx3, {
    type: 'pie',
    plugins: [ChartDataLabels],
    data: {
        labels: menuNameList,
        datasets: [{
            label: '주문 건수',
            data: menuOrderCount,
            backgroundColor: [
                '#F94144',
                '#F3722C',
                '#F8961E',
                '#F9844A',
                '#F9C74F',
                '#90BE6D',
                '#43AA8B',
                '#4D908E',
                '#577590',
                '#277DA1',
                '#9d4edd'
            ],
            borderColor: [
                'white'
            ],
            borderWidth: 1,
            hoverOffset: 4
        }]
    },
    options: {
        
        plugins: {
            legend: {
                position: 'bottom',
                datalabels: {
                    color: 'black'
                }
            },
    },
}    
});

