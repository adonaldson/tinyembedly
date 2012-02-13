# Tinyembedly [![Build Status](https://secure.travis-ci.org/dies-el/tinyembedly.png)](http://travis-ci.org/dies-el/tinyembedly)

A super tiny Embedly oEmbed library, using HTTParty. It makes a GET request to Embed.ly and returns the response in the form of a hash.

Extracted from [Elementalise](http://elementalise.com).

# Installation

```ruby
get install tinyembedly
```

or, add it to your Gemfile

```ruby
gem 'tinyembedly'
```

# Prereqs

You don't _need_ an Embed.ly API key, but you should really get one. [Sign up for an Embed.ly account](http://embed.ly/pricing) (they have a free plan).

# Getting started

```ruby
response = Tinyembedly::Oembed.to_hash("http://youtu.be/12jmp4KVRPM")
```

Which calls [this endpoint](http://api.embed.ly/1/oembed?url=http://youtu.be/12jmp4KVRPM) and converts it to a hash.

Thats it.

# Contributors

- Ebony Charlton

Noone else. Could you help? Go on. Goooo on. Goooooooo on!

# License

This code is free to use under the terms of the MIT license.
