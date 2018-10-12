# Slimline
A small basic helper to allow progressively loading images, Nothing really special this was done more as a test to myself to create a rails gem :)

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'slimline'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install slimline
```

Once installed to make sure that your images still work when javascript isn't active add the following to the head tag

```erb
class="<%= slimline_js_check_class %>"
```

Then in the `<head>` section before any css rendering enter:
```erb
  <%= slimline_js_check %>
```

# Usage

Now you have installed the about, you will be able to call in the body the `slimine_image_tag` like:

```erb
<%= slimline_image_tag 'test.jpg', width: 1000, small_image: 'test_small.jpg', alt: "Hello World" %>
```

Below is a crude example how to use this:
```erb
<!DOCTYPE html>
 <html class="<%= slimline_js_check_class %>">
  <head>
    <title>Slimline</title>
    <%= csrf_meta_tags %>
    <%= slimline_js_check %>
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>
  <body>
    <%= slimline_image_tag 'test.jpg', width: 1000, small_image: 'test_small.jpg', alt: "Hello World" %>
  </body>
 </html>
```

You are also able to add a srcset tag to the `slimline_image_tag` that will do srcsets too e.g:

```erb
<%= slimline_image_tag 'test.jpg', width: 1000, small_image: 'test_small.jpg', srcset: "<%= image_path 'test_x1.jpg' %> x1, <%= image_path 'test_x2' %> x2 ", alt: "Hello World" %>
```

## Contributing
Tests are my next step in learning, so tests are currently not present.

To contribute, fork, make your change and do a pull request.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
