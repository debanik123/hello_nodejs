const http = require('http');

const server = http.createServer((req, res) => {
    // Set the response header content type to text/plain
    res.setHeader('Content-Type', 'text/plain');
    
    // Check the requested URL
    if (req.url === '/') {
        // Respond to the root URL ("/")
        res.statusCode = 200;
        res.end('Hello World\n');
    } else if (req.url === '/dummy') {
        // Respond to the dummy API URL ("/dummy")
        res.statusCode = 200;
        res.end('This is the dummy API response \n');
    } else {
        // Handle 404 Not Found for other URLs
        res.statusCode = 404;
        res.end('404: Not Found\n');
    }
});

// Start the server on port 3000
server.listen(3000, () => {
    console.log('Server running on port 3000');
});
