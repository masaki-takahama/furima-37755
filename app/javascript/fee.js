function post (){
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  const itemPrice = document.getElementById("item-price");

  itemPrice.addEventListener("input", () => {
    let tax = Math.floor(itemPrice.value * 0.1);
    addTaxPrice.innerHTML = tax;
    profit.innerHTML = itemPrice.value - tax;
  });

};

window.addEventListener('load', post);
