$(document).ready(function() {
  $('.tickerSearch').select2(); // Enabling search for ticker
})

$(document).on('change', '.tickerSelect, .rangeSelect, .intervalSelect', function() {
  $('#updateChartForm').submit();
});
