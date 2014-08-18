# Image Gallery Rails Application

## Requirements

* ImageMagick
* Ruby 2.1.2
* Rails 4.1.4
* bower

## Setup

* Copy `.env` file

```bash
cp .env.example .env
```

* Change the `.env` variables

* Install bower

```bash
npm install -g bower
```

* Bundle install

```bash
bundle install
```

* Install bower dependencies

```bash
rake bower:install
```

* Install foreman

```bash
gem install foreman
```

* Run foreman

```bash
foreman start
```
