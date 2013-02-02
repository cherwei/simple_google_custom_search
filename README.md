# SimpleGoogleCustomSearch

With Simple Google Custom Search, help people search what they need in your website just like in official google site.

## Installation

Add this line to your application's Gemfile:

    gem 'simple_google_custom_search'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_google_custom_search

## Configuration

You need to define a <tt>constant variable</tt> for the API to search the matching words to your domain:

    SGCS_CONFIG = {
        domain: 'YOUR_SITE_URL'
    }

## Usage

To perform a search:

    results = SimpleGoogleCustomSearch.search("simple", offset +optional+)

The +results+ variable is now a SimpleGoogleCustomSearch::ResultSet object:

    results.total            # number of results (integer)
    results.item             # array of result objects (SimpleGoogleCustomSearch::Result)

Iterate through the results:

    results.item.each do |result|
        result.title           # result title
        result.link            # result URL
        result.description     # excerpt, with terms highlighted
    end

## TODO

1. Unit Test
2. Add Pagination

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
