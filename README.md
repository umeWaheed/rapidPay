# RapidPay

A tool that lets you create cards and update balances by making transactions.

# Requirements

* Ruby version: 3.1.2
* Rails version: 7.0.8
* Sidekiq
* Whenever (for cron job)

# Setup

Run the following commands to setup
1. Clone the repo
2. Install required gems 
```
bundle install
```
3. Run migrations and seeds
```
rails db:migrate
rails db:seed
```
4. Run sidekiq
```
bundle exec sidekiq
```
6. Add cronjob
```
whenever --update-crontab
```
