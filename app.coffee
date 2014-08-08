express = require 'express'
stylus = require 'stylus'
nib = require 'nib'

app = express()

app.set 'views', "#{__dirname}/views"
app.set 'view engine', 'jade'
app.use stylus.middleware
  src: "#{__dirname}/style"
  dest: "#{__dirname}/public"
  compile:(str, path) ->
    stylus(str)
    .set 'filename', path
    .set 'compress', true
    .use nib()
  debug: true
  force: true

app.use express.static "#{__dirname}/public"


app.get '/', (req, res) ->
  res.render 'index'


app.listen 3000