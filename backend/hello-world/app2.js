exports.lambdaHandler = async (event, context) => {
  const output = event.records.map((record) => {
    const payload = (Buffer.from(record.data, 'base64')).toString('ascii');
    const result = { message: payload };
    return {
      // この形式でないとエラーになる
      recordId: record.recordId,
      result: 'Ok',
      data: (Buffer.from(JSON.stringify(result))).toString('base64')
    };
  });
  console.log(output);
  return { records: output };
};
