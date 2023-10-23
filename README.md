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

# Endpoints
                       card_transactions GET    /cards/:card_id/transactions(.:format)                                                            transactions#index
                                         POST   /cards/:card_id/transactions(.:format)                                                            transactions#create
                    new_card_transaction GET    /cards/:card_id/transactions/new(.:format)                                                        transactions#new
                                   cards GET    /cards(.:format)                                                                                  cards#index
                                         POST   /cards(.:format)                                                                                  cards#create
                                new_card GET    /cards/new(.:format)                                                                              cards#new
                                    card GET    /cards/:id(.:format)                                                                              cards#show
                                         PATCH  /cards/:id(.:format)                                                                              cards#update
                                         PUT    /cards/:id(.:format)                                                                              cards#update
# Samples
* json response
<img width="1439" alt="image" src="https://github.com/umeWaheed/rapidPay/assets/22251762/ed2826e8-9592-47bd-a77f-fde384a03bb9">

* Loom of the working
https://www.loom.com/share/a958418397d14805b646eb1b7cc06bc2
