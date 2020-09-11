const http = require('http')
const server = http.createServer((req, res) => {
    console.log('New connection')
    res.end('Hello Dave! - continuous deployment!')
})
const PORT = process.env.PORT || 8080
server.listen(PORT, () => console.log('Listening'))

// for Dockerfile:
//FROM node:13-slim
//WORKDIR /app
//ADD . /app
//CMD node server.js