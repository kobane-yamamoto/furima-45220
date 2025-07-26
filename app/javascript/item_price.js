const price = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value); // ← 文字列を数値に変換

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (!isNaN(inputValue)) {
      const fee = Math.floor(inputValue * 0.1);
      const profit = inputValue - fee;
      addTaxDom.innerHTML = fee;
      profitDom.innerHTML = profit;
    } else {
      addTaxDom.innerHTML = '0';
      profitDom.innerHTML = '0';
    }
  });
};

// turbo:load に加えて turbo:render も追加
window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);