function checkCashRegister(price, cash, cid) {
  const coins = {
    'ONE HUNDRED': 100,
    TWENTY: 20,
    TEN: 10,
    FIVE: 5,
    ONE: 1,
    QUARTER: 0.25,
    DIME: 0.1,
    NICKEL: 0.05,
    PENNY: 0.01,
  };

  const coinsInCash = Object.fromEntries(cid.reverse());

  const change = {
    status: '',
    change: [],
  };

  let returnChange = cash - price;
  const cashInDrawer = cid.reduce((acc, curr) => acc + curr[1], 0);

  if (cashInDrawer < returnChange) {
    change.status = 'INSUFFICIENT_FUNDS';
  } else if (cashInDrawer === returnChange) {
    change.status = 'CLOSED';
    change.change = cid.reverse();
  } else {
    for (let coin in coins) {
      let coinQuantity = 0;
      while (returnChange >= coins[coin] && coinsInCash[coin] > 0) {
        coinQuantity += coins[coin];
        coinsInCash[coin] -= coins[coin];
        returnChange -= coins[coin];
        returnChange = returnChange.toFixed(2);
      }
      if (coinQuantity > 0) {
        change.change.push([coin, coinQuantity]);
      }
    }
    if (returnChange === '0.00') {
      change.status = 'OPEN';
    } else {
      change.status = 'INSUFFICIENT_FUNDS';
      change.change = [];
    }
  }
  return change;
}
