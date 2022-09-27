# Gamco - Google Analytics Helper


## Installation

Add `Gamco` to your application's Gemfile:

```ruby
gem "gamco"
```

And then install gamco:

```bash
rails g gamco:install
```

## Configuration

Provide your `TAG_ID` in `config/initializers/gamco.rb`:

```ruby
Gamco.setup do |config|
  # ===> Required GA4 configuration options
  config.tag_id = "G-XXXXXXXXX"

  ...
end
```

## Usage

Usually you'll want to add your Google Analytics script immediately after
your `<head>` tag in your html. In rails, this is usually done in your
layout file `(app/views/layouts/application.html.erb)`.

```ruby
<html>
  <head>
    <%= ga_javascript_tags %>
    ...
  </head>
```

This will send the default `page_view` event every time the user navigates
to a different path in your application. You can pass other dimensions if
you want to collect extra data. Example:

```ruby
<html>
  <head>
    <%= ga_javascript_tags
      language: I18n.locale,
      environment: Rails.env %>
    ...
  </head>
```

### Custom events

Also, you can send custom messages to Google Analytics per page or when
needed by using the `ga_tag` helper as the following example:

```ruby
# app/views/products/show.html.erb
<%= ga_tag("event", "product_view", { product_id: @product.id }) %>

...
```

### Secure data

There are sensitive information that you might not want to send it directly
to Google Analytics to prevent some vulnerabilities, you can achieve this
by using the `ga_secure` helper which generates a digest for the passed value:

```ruby
# app/views/products/show.html.erb
<%= ga_tag("event", "product_view", {
  user: ga_secure(current_user.id),
  product_id: @product.id
}) %>

...
```

By default the generated value is a MD5 digest. You can configure which
algorithm will be used in the initializer `config/initializers/gamco.rb`:

```ruby
Gamco.setup do |config|
  ...

  # ===> Method to secure sensitive data.
  # config.secure = -> (value) {
  #   Digest::MD5.hexdigest(value)
  # }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake spec` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and
then run `bundle exec rake release`, which will create a git tag for the
version, push git commits and the created tag, and push the `.gem` file
to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/amco/gamco.
This project is intended to be a safe, welcoming space for collaboration, and
contributors are expected to adhere to the
[code of conduct](https://github.com/amco/gamco/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the
[MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Gamco project's codebases, issue trackers, chat rooms
and mailing lists is expected to follow the
[code of conduct](https://github.com/amco/gamco/blob/master/CODE_OF_CONDUCT.md).
