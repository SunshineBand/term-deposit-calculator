# Take Home Code Exercise

👋 Hi thanks for taking the time to review my submission!

In an attempt to keep my time under the 2 hours max, I've spent more time on the README and as a result there
are some missing improvements I would have enjoyed adding for this.
Please take some time to take a look through the Assumptions and Thoughts section. The "Problem statement and
initial information" section is only a copy of the problem statement's pdf, so feel free to stop reading there.

## 🚧 Setup

You will need `ruby` installed on your machine, I've included a `.ruby-version` file.

You can get running with
```sh
bundle install
ruby ./main.rb
```

And tests can be run with
```sh
bundle exec rspec
```

Alternatively you can use this as a binary with
```sh
chmod +x ./main.rb
./main.rb <...inputs>
```

Worst case you can use the provided Dockerfile 🐳
Note: you cannot provide arguments from the cli with this, you must update the Dockerfile
With the docker daemon running:
```sh
docker build -t deposit .
docker run deposit
```

The program will give a quick usage summary however it is limited.

## 🧠💭 Assumptions and Thoughts

- Assume rounding to nearest whole dollar is acceptable to the user
- Input validation could use more work and given more time this behaviour might have to be extracted
from the `Interest` class as it holds a few responsibilities at the moment. This is fine considering this
is a small application, but as the complexity grows the user input validation should evolve.
- Dependency injection could have been used to simplify the tests where we are asserting output to stdout
- The spec file has some duplication and given more time it would make sense to group the subject and
vary the input with something like an rspec `:let` variable.
- Only a few tests were included as an end to end test and the app would benefit from unittesting the specific
details
- All the code has been kept in the same file, because it's a small application this makes sense. The first
change to be made as the features grow is to extract that `Interest` class into it's own file and also
include additional unittests for it. This would be another way to improve the app's testing.

There are a couple approaches you could take to define the result for each frequency option.
The one you choose depends on personal opinion on readability. One path I did not take is to create
a factory with different frequency classes for calculating that frequencies' interest. Each child of
Interest would have their own `compound` implementation where the frequency value is given to the
equation. Something like below.

```ruby
class Interest
    # ...
    def compound
        return generic_compounding_formula(..arguments)
    end
end

class MonthlyInterest < Interest
    def compound
        return generic_compounding_formula(..arguments, frequency='monthly')
    end
end
```

## Problem statement and initial information

We are a company that creates banking software. We’d like you to build a very
simple term deposit calculator that takes as inputs:
Start deposit amount (e.g. $10,000)
Interest rate (e.g. 1.10%)
Investment term (e.g. 3 years)
Interest paid (monthly, quarterly, annually, at maturity)
And produces as output:
Final balance (e.g. $10,330 on the above inputs, interest paid at maturity).
You can assume that all proceeds are reinvested into the term deposit for its duration.

### Non-functional requirements

CLI is fine, although of course if you want to make a simple UI because you
think that best demonstrates your skills, please do. We won’t give points to a
beautiful UI so ask you to please spend your time on the code and not CSS if
you do decide to create a UI.

We want you to spend at most 2 hours on this as we need a conversation
starter and not a fully pro application. Refer to the guide below for what we are
looking for, and as long as your solution attempts to address each of these
points you should consider yourself done. Please don’t include setup (of
computer/environment) time in the 2 hours, we all know how that can blow
out.
Any language is fine, and we recommend you choose your strongest language.
Please submit using a link to a Github repository. If this could cause issues for
you we will accept a .zip file with your code.
What are we looking for?
Usability - can we work out how to install and run it?
Testing - have you written tests and do they pass?
Functionality - does the program work as expected?
Application design - is there clear separation of concerns?
Simplicity - can we understand your code and how you’ve structured it?
Feedback - how have you handled errors and let the user know?
Code fluency - how proficient are you at the technologies you’ve chosen?

*HINT: There are all kinds of compound interest equations out there. The ones
that take year and month as arguments tend to be a lot more confusing than those
that just take a single time input (e.g. month OR year, not both).
