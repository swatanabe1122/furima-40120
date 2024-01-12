const price = () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const ProfitDom = document.getElementById("profit");
  
  if (priceInput && addTaxDom && ProfitDom) { 
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
      ProfitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML);
      });
    }
  };


window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);