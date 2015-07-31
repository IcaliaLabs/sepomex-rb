# Sepomex-rb

A super simple Ruby wrapper to consume the Sepomex API at [http://sepomex-api.herokuapp.com/api/v1/zip_codes](http://sepomex-api.herokuapp.com/api/v1/zip_codes)

## Table of contents
- [Quick start](#quick-start)
- [Usage](#usage)
- [Bug tracker & feature request](#bug-tracker-&-feature-request) 
- [Development](#development)
- [Contributing](#contributing)
- [Heroes](#heroes)
- [License](#license)

## Quick Start

Add this line to your application's Gemfile:

```ruby
gem 'sepomex'
```

And then execute:

```console
% bundle
```

Or install it yourself as:

```
% gem install sepomex
```

## Usage

```ruby
zip_codes = Sepomex::ZipCode.all

=> [ #<Sepomex::ZipCode id=1, d_codigo="01000", d_asenta="San Ángel", d_tipo_asenta="Colonia", d_mnpio="Álvaro Obregón", d_estado="Distrito Federal", d_ciudad="Ciudad de México", d_cp="01001", c_estado="09", c_oficina="01001", c_cp="", c_tipo_asenta="09", c_mnpio="010", id_asenta_cpcons="0001", d_zona="Urbano", c_cve_ciudad="01">, 
	 #<Sepomex::ZipCode id=2...]
```

You can specify the page to request as an option on the method.

```ruby
zip_codes = Sepomex::ZipCode.all(page: 2)

=> [ #<Sepomex::ZipCode id=51, d_codigo="01000", d_asenta="San Ángel", d_tipo_asenta="Colonia", d_mnpio="Álvaro Obregón", d_estado="Distrito Federal", d_ciudad="Ciudad de México", d_cp="01001", c_estado="09", c_oficina="01001", c_cp="", c_tipo_asenta="09", c_mnpio="010", id_asenta_cpcons="0001", d_zona="Urbano", c_cve_ciudad="01">, 
	 #<Sepomex::ZipCode id=52...]
```

## Bug tracker & feature request

Have a bug or a feature request? [Please open a new issue](https://github.com/IcaliaLabs/sepomex-rb/issues). Before opening any issue, please search for existing issues.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sepomex/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Heroes

**Abraham Kuri**

+ [http://twitter.com/kurenn](http://twitter.com/kurenn)
+ [http://github.com/kurenn](http://github.com/kurenn)
+ [http://klout.com/#/kurenn](http://klout.com/#/kurenn)

**Oscar Elizondo**

+ [http://twitter.com/oehinojosa](http://twitter.com/oehinojosa)
+ [http://github.com/oelizondo](http://github.com/oelizondo)


## Copyright and license

Code and documentation copyright 2015 Icalia Labs. Code released under [the MIT license](LICENSE).
