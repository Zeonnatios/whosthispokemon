require('dotenv').config();

module.exports = {
  publicPath: process.env.VUE_APP_NODE_ENV === 'production'
    ? '/whosthispokemon'
    : '/',
};
