require('dotenv').config()
const express = require('express')
const cors = require('cors')
let PORT = process.env.PORT
let NODENAME = process.env.NODENAME

const app = express()
app.use(cors())

app.disable('x-powered-by')

app.use([/^\/$/, '/home'], require('./router/home'))

app.listen(port, () => console.log(`Welcome ${NODENAME} Started on port ${port} Pid - ${process.pid}`))