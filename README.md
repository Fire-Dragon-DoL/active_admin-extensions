# ActiveAdmin::Extensions

Collection of extensions for ActiveAdmin

## Installation

Add this line to your application's Gemfile:

    gem 'active_admin-extensions'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_admin-extensions

## Usage

The following modules are available:
- `PublicResources`
- `ActionStatus`
- `FlashMessages`
- `RedirectAfterActionTo`

And they can be easily used in this way:

```ruby
  controller do
    include ActiveAdmin::Extensions::Controller::PublicResources
    include ActiveAdmin::Extensions::Controller::ActionStatus
    include ActiveAdmin::Extensions::Controller::FlashMessages
    include ActiveAdmin::Extensions::Controller::RedirectAfterActionTo
  end
```

**TODO:** Add usage instructions for each module

## Contributing

1. Fork it ( https://github.com/[my-github-username]/active_admin-extensions/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
