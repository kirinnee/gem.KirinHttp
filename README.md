# KirinHttp

Simple HTTP Wrapper that uses HttpMessage objects and HttpResponse object to interact with REST API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kirin_http'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kirin_http

## Usage

#### Create a HTTP Message

To send a HTTP request, firstly we have to make a Message object of the class `KirinHttp::Message`.

This class consists of the `endpoint`, `content`, `method` and `header`

|Field | Description | Example Value |
|--- | --- | --- |
|endpoint | the endpoint the Http request needs to query. | `https://host.com/api/key/5?name=john` |
|content | any type of content, from json to bytes | `IO.binread "a.png"` `{"id":5,"name":"john"}.to_json` |
|method | the HTTP verb to use. It has be in symbols | `:get` `:put` `:post` `:patch` `:head` `:delete` |
|header | the headers of the HTTP as a hash object |`{"Content-Type":"application/json", "Accept": "plain/text" }` |

Example:

```ruby
require "kirin_http"

endpoint = "https://host.com/api/todo/5?name=john"
content = {"id":5, "name": "john"}
header = {"Content-Type":"application/json", "Accept":"plain/text"}
message = KirinHttp::Message.new endpoint, :post, content, header # Obtained message object
p message
```

#### Sending HTTP Message and obtaining response

To send a HTTP Message you created, you will need a `HttpClient`. In this library, we provided a `BasicClient`, 
which is simply a wrapper around `net/http`. 

```ruby
http = KirinHttp::BasicClient.new
resp = http.send message #obtained response
p resp

``` 

To read response, there are a three attributes that you can obtain, the response header - `header`, the response 
payload - `content` and the status code `code`

| Field | Description |
| --- | --- |
| header | Hash that contains response headers |
| content | content in whichever mime type promised |
| code | the status code as integer, like `404` or `200` |

```ruby
http = KirinHttp::BasicClient.new
resp = http.send message
resp.header # Get the headers as hash
resp.content # Obtains the content of the response
resp.code #Obtains the status code
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. 
Then, run `rake spec` to run the tests. You can also run `bin/console` 
for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. 

## Contributing

Bug reports and pull requests are welcome on GitLab at https://gitlab.com/ruby-gem/kirin_http. 
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected 
to adhere to the [Contributor Covenant](CODE_OF_CONDUCT.md) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of Conduct

Everyone interacting in the KirinHttpClient project’s codebases, issue trackers, chat 
rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
