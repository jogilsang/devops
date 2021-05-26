// title : OAuth에 사용되는 base64로 변환하기
// contents : Postman - Pre-request Scripts
// dated : 2021-01-03
// created : jogilsang

var CryptoJS = require('crypto-js');

var clientId = pm.collectionVariables.get('client_id');
var clientSecret = pm.collectionVariables.get('client_secret');

console.log(clientId);
console.log(clientSecret);

var textString = clientId + ":" + clientSecret;
var words = CryptoJS.enc.Utf8.parse(textString); 
var base64 = CryptoJS.enc.Base64.stringify(words); // EX : string: 'SGVsbG8gd29ybGQ='

console.log(base64);
pm.collectionVariables.set('authorization_basic', base64);
