exports.lambdaHandler = async (event, context) => {
  event.Records.forEach(record => {
    const payload = Buffer.from(record.kinesis.data, 'base64').toString('ascii');
    console.log('Decoded payload:', payload);
  });
};
