// Vars
var progressbars = ['#steady', '#slowdown', '#speedup'],
progressvalues = [[0,10,20,30,40,50,60,70,80,90,100],[0,30,52,70,84,92,96,98,99,99,100],[0,1,1,2,4,8,16,30,48,70,100]],
progressbar,
timer,
value,
max = 100,
time = 1000;

// Init
var init = function () {
  value = 0;
  for (i = 0; i < progressbars.length; i++) {
    progressbar = $(progressbars[i]);
    progressbar.attr('max', max);
    progressbar.attr('value', 0);
  }
}

var loading = function(currbar) {
  value += 1;
  progressbar.attr('value', progressvalues[currbar][value]);
  
  if (progressvalues[currbar][value] == max) {
    alert("Maxed out");
    clearInterval(timer);
    value = 0;
  }  
}  

var animate = function (currbar) {
  init();
  progressbar = $(progressbars[currbar]);
  timer = setInterval(function() {  
    loading(currbar); }, time);
}

init();
