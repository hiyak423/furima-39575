function prices() {
  const priceInput = document.getElementById("item-price");
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const ProfitDom = document.getElementById("profit");

    addTaxDom.innerHTML = Math.round(inputValue * 0.1 );
    ProfitDom.innerHTML = inputValue - addTaxDom.innerHTML;
    })
  };
  window.addEventListener('click',prices);
