window.addEventListener('keyup', function(){
const data = document.getElementById("item-price").value;
  console.log(data)

    const profit = Math.round(data * 0.9);
    const fee = (data - profit);

    const taxprice = document.getElementById("add-tax-price")
    const pricecontent = document.getElementById("profit")

    taxprice.innerHTML = fee
    pricecontent.innerHTML = profit
    })