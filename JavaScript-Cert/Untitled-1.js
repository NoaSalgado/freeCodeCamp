

function telephoneCheck(str) {
    const regExp = /[1|\s|(]?[0-9]{3}[\s|)|-]*[0-9]{3}[\s|-]?[0-9]{4}/
    return regExp.test(str);
  }

console.log(telephoneCheck("2 (757) 622-7382"))