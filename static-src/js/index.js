const countDown = document.getElementById('count-down')

const countDownInterval = setInterval(() => {
  countDown.innerText === '0' 
  ? clearInterval(countDownInterval)
  : countDown.innerText-- 
}, 1000)