const express = require('express');
const mongoose = require('mongoose');

const app = express();

app.set('view engine', 'ejs');

app.use(express.urlencoded({ extended: false }));

// Connect to MongoDB
console.log('MongoDB url' + process.env.MONGO_HOST)
const host = process.env.MONGO_HOST
const database = process.env.MONGO_DATABASE
const mongoURL = "mongodb://"+host+"/"+database
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

app.post('/item/add', (req, res) => {
  const newItem = new Item({
    name: req.body.name
  });

  newItem.save().then(item => res.redirect('/'));
});
const port = process.env.APP_PORT
app.listen(port,() => console.log('Server running...'));
