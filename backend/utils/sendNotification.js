const axios = require('axios');
const sendNotification = (token, title, body) => {
  const payload = {
    to: token,
    notification: {
      title,
      body,
    },
  };

  axios.post('https://fcm.googleapis.com/fcm/send', payload, {
    headers: {
      'Content-Type': 'application/json',
      Authorization: `key=YOUR_SERVER_KEY`,
    },
  })
  .then(response => console.log('Notificación enviada:', response.data))
  .catch(error => console.error('Error al enviar notificación:', error));
};

module.exports = sendNotification;
