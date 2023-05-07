const crypto = require('crypto');

function encrypt(cardNumber = '') {
  const encryptedNumber = crypto.createHash('sha256')
    .update(cardNumber.toString())
    .digest('hex');
  return encryptedNumber;
}


module.exports.encrypt = encrypt;