# Matrix Interface

We need to make intelligent decisions when hiding and fighting against machines. Since not everyone is a chosen one I'm making available an interface to map our operators' locations.

## Requirements

 - Ruby 2.5.3
 - Rails ~> 5.2.3
 - PostgreSQL
 - Redis

## Installation

You can deploy this interface in your own terminal by cloning this repository code and running some installation commands:

```
$ bundle install && bundle exec rake db:reset
```

## Running

To let the interface run through your terminal do this:

```
$ foreman start
```

It will boot both the web and the worker processes needed. If you need to tweak some command options change your `Procfile`

## Usage

The interface consists in two endpoints:

```
[GET ] /routes to get whatever we already collected.

passphrase | fasten your seat belt Dorothy | XXXXXXXXXXXXXXXXXXXXXXX
source     | alphanumeric code             | sentinels, sniffers, loopholes
```

```
[POST] /routes to import the parsed data into our system.

passphrase | fasten your seat belt Dorothy | XXXXXXXXXXXXXXXXXXXXXXX
source     | alphanumeric code             | sentinels, sniffers, loopholes
start_node | alphanumeric code             | alpha, beta, gamma, delta, theta, lambda, tau, psi, omega
end_node   | alphanumeric code             | alpha, beta, gamma, delta, theta, lambda, tau, psi, omega
start_time | ISO 8601 UTC time             | YYYY-MM-DDThh:mm:ss
end_time   | ISO 8601 UTC time             | YYYY-MM-DDThh:mm:ss
```

To use them you should first generate a passphrase or use mine, which gets injected on the installation instructions (Kans4s-i$-g01ng-by3-bye). You can also create a new passphrase and start sending your own location data on the Rails console:

```
> Pass.create(phrase: 'My-53cr37')
```

## Testing

If you need to extend or make this interface better you should always check if nothing gets broken in the process, use the following command to do that:

```
$ bundle exec rspec
```

## Contributing

Feel free to contribute, most of us aren't even free from the Matrix yet. When it comes to freedom, the more the better.

-------

Follow the white rabbit
