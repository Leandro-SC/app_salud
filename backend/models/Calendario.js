const { google } = require('googleapis');
const calendar = google.calendar('v3');

const generateMeetLink = async (clientName, startTime, endTime) => {
  const auth = new google.auth.GoogleAuth({
    keyFile: 'path-to-service-account-file.json', // Reemplaza con la ruta a tu archivo de cuenta de servicio
    scopes: ['https://www.googleapis.com/auth/calendar'],
  });

  const authClient = await auth.getClient();
  google.options({ auth: authClient });

  const event = {
    summary: `Consulta con ${clientName}`,
    start: { dateTime: startTime },
    end: { dateTime: endTime },
    conferenceData: {
      createRequest: {
        requestId: 'some-unique-id',
        conferenceSolutionKey: { type: 'hangoutsMeet' },
      },
    },
  };

  const response = await calendar.events.insert({
    calendarId: 'primary',
    resource: event,
    conferenceDataVersion: 1,
  });

  return response.data.hangoutLink;
};
