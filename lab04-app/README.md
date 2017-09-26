Based on https://github.com/18F/cf-hello-worlds/tree/master/ruby-sinatra

## Run locally

I like to keep my application gem separate, hence the `--path` option:
```
bundle --path vendor/bundle
PORT=3000 ruby server.rb
```

Visit http://0.0.0.0:3000


