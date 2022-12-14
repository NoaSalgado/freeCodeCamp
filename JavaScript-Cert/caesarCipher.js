function rot13(str) {
  const alphabet = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  const rotString = [];

  for (let char of str) {
    if (char.match(/[A-Z]/)) {
      const rot13 = alphabet.indexOf(char) + 13;
      const rot13Index = rot13 === 26 ? 0 : rot13 > 26 ? rot13 - 26 : rot13;
      rotString.push(alphabet[rot13Index]);
    } else {
      rotString.push(char);
    }
  }

  return rotString.join("");
}
