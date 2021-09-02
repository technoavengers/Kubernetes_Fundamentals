const express = require('express');
const mongoose = require('mongoose');

const app = express();

app.set('view engine', 'ejs');

app.use(express.urlencoded({ extended: false }));

// Connect to MongoDB
console.log('MongoDB url' + process.env.MONGO_HOST)
const host = process.env.MONGO_HOST
const database = process.env.MONGO_DATABASE
console.log(host)
console.log(database)
const mongoURL = "mongodb://"+host+"/"+database
console.log(mongoURL)
mongoose
  .connect(
    mongoURL,
    { useNewUrlParser: true }
  )
  .then(() => console.log('MongoDB Connected'))
  .catch(err => console.log(err));

const Item = require('./models/Item');

app.get('/', (req, res) => {
  Item.find()
    .then(items => res.render('index', { items }))
    .catch(err => res.status(404).json({ msg: 'No items found' }));
});

app.get('/healthy', (req, res) => {
      res.render(res.status(200).json({ msg: 'I am super healthy' }))
});

app.post('/item/add', (req, res) => {
  const newItem = new Item({
    name: req.body.name
  });

  newItem.save().then(item => res.redirect('/'));
});
const port = process.env.APP_PORT
app.listen(port,() => console.log('Server running...'));
