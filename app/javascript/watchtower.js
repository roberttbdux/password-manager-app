document.addEventListener("DOMContentLoaded", () => {
    console.log("Chart:", Chart);

    const chartElement = document.getElementById("scoreChart");
    if (chartElement) {
      const scoreValue = parseInt(chartElement.dataset.score, 10);
      const remainder = 100 - scoreValue;
  
      const ctx = chartElement.getContext("2d");
      const scoreChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
          datasets: [{
            data: [scoreValue, remainder],
            backgroundColor: ['#28a745', '#e9ecef'],
            borderWidth: 0
          }]
        },
        options: {
          cutout: '70%',
          plugins: {
            tooltip: { enabled: false },
            legend: { display: false }
          }
        }
      });
  
      document.querySelector('.chart-center-label h4').innerText = scoreValue;
    }
  });

  