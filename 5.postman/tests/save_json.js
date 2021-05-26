// title : save_json
// contents : Postman - tests Scripts
// dated : 2021-05-27
// created : jogilsang

const responseJson = pm.response.json();
var access_token = responseJson.data.access_token;

console.log(access_token);
pm.collectionVariables.set('access_token', access_token);
