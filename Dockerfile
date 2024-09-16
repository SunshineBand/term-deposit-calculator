FROM ruby:3.3.5

WORKDIR /app

COPY . .

RUN bundle install

# You can change this to run whatever tests you prefer
CMD ["ruby", "./main.rb", "10000", "1.10", "3", "maturity"]
