window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.round(inputValue * 0.1 );

    const ProfitDom = document.getElementById("profit");
      ProfitDom.innerHTML = Math.round(inputValue - addTaxDom.innerHTML);
    })
  });
