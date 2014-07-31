Angular Wallet
==============

[ ![Codeship Status for ArnaudRinquin/wallet](https://www.codeship.io/projects/4bb61f00-f953-0131-b886-26b5a351acb8/status)](https://www.codeship.io/projects/28850)

## Stack

### Toolchain

* Gulp
* Browserify
* CoffeeScript
* Jade
* SASS + Compass
* Karma + Jasmine
* BrowserSync

### Lib used on client side

* Angular
  * angular-ui-dropdown
  * angular-ui-routeur
  * angularLocalStorage
  * angular-bootstrap-switch
* Bootstrap
  * bootstrap-switch
* Font-Awesome
* jQuery

## Setup & build

### Install Gulp and Bower Globally
Gulp must be installed globally in order to use the command line tools. *You may need to use `sudo`*
```
npm install -g gulp bower
```

### Install Compass (if you haven't already)
The gulp-compass module relies on Compass already being installed on your system.
```
gem update --system
gem install compass
```
### Install npm and bower dependencies
```
npm install && bower install
```
This runs through all dependencies listed in `package.json` and downloads them
to a `node_modules` folder in your project directory.

### Run gulp and be amazed.
```
gulp
```

This will create and run the task defined in `gulpfile.js`. If you're on OS X,
and have Chrome installed, a window will open displaying the demo page. If not,
you can visit http://localhost:8080 to view the test page.

## Deployment

### Current instances

Continuous deployment through codeship: [awallet](http://awallet.herokuapp.com/)

### Heroku

#### Create an app

```
heroku apps:create wallet
```

#### Set the app custom buildpack:*

```
heroku config:add BUILDPACK_URL=https://github.com/9elements/heroku-buildpack-nodejs-gulp-haml-sass-compass.git -a wallet
```
#### Add the heroku app as a git repo:*

```
git remote add heroku git@heroku.com:wallet.git
```

#### Deploy the app

```
git push heroku master
```

## Technical details

### Models

#### Wallet

Constructor

`new WalletModel(currency, [transactions], [repository])`

Attributes

* `currency`: A `Currency` model instance
* `transactions`: Array of `Transaction` model instances

Methods

* `addTransaction(transaction)`: Adds a transaction to the list. Will call `repository.onUpdate()`
* `setCurrency(currency)`: Replace current currency, will call `repository.onUpdate()`

#### Transaction

Constructor

`new TransactionModel(amount, isCredit, [createdAt])`

Attributes

* `amount`: A float value
* `isCredit`: when applied to a number, should amount be added or removed?
* `createdAt`: A stored creation date, default is `new Date()`

Methods

* `applyToNumber(number)`: depending on `isCredit`, adds/remove `amount` to/from number
* `serialize`: returns a clean storable object
* `TransactionModel.deserialize(serializedObject)`: returns a Transaction instance.

#### Currency

`new CurrencyModel(iso, symbol, iconClass)`

Attributes

* `iso`: The currency ISO code (USD, GPB...) see [ISO 4217](http://en.wikipedia.org/wiki/ISO_4217)
* `symbol`: The textual currency symbol ($, £...)
* `iconClass`: The font-awesome icon class (fa-usd, fa-gbp...)
* `CurrencyModel.instances`: some already instanciated currencies (USD, GBP, EUR)

Methods

* `serialize`: returns a clean storable object
* `CurrencyModel.deserialize(serializedObject)`: returns a Currency
* `CurrencyModel.getFromIso(iso)`: returns the existing currency among `CurrencyModel.instances`

### Directives

#### Wallet

A directive that displays a wallet transactions list and balance

Attributes:

* `wallet`: a `WalletModel` object

#### TransactionForm

Add form directive for transaction creation

Attributes:

* `transaction`: an initial `TransactionModel` to fill the form with
* `onSubmit`: submit callback, called with the `transaction`
* `currency`: the `CurrencyModel` to be used (display purpose only)
* `currentTotal`: used to ensure the transaction would not render the balance negative.

#### TransactionTrItem

Add transaction directive utputing a table row (`<tr>`) for the given `transaction`

Attributes:

* `transaction`: an initial `TransactionModel` to fill the form with
* `currency`: the `CurrencyModel` to be used (display purpose only)

## TODO

* Store amounts has cents instead of float
* Currency icons as a filter
* Add appache on deployed apps to make it offline (easy with [gulp-manifest](https://github.com/hillmanov/gulp-manifest))
* Add optional label on transactions?
