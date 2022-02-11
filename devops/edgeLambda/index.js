exports.handler = (event, context, callback) => {
    let request = event.Records[0].cf.request    
    var olduri = request.uri;
    var newuri = olduri.replace(/\/$/, '\/index.html');
    request.uri = newuri;
    return callback(null, request)
};
