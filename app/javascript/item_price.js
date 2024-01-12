document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  if (priceInput && addTaxDom && profitDom) { 
    priceInput.addEventListener("input", () => {
      const inputValue = parseInt(priceInput.value);

      if (!isNaN(inputValue)) {
        const tax = Math.floor(inputValue * 0.1);
        const profit = Math.floor(inputValue - tax);

        addTaxDom.innerHTML = tax;
        profitDom.innerHTML = profit;
      } else {
        addTaxDom.innerHTML = '-';
        profitDom.innerHTML = '-';
      }
    });
  }
});
