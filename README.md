# Kermit

## What's this?

KermitPFC-core is a framework that can collect information from different social networks for data mining purposes. 
It also allows different streams serve under a common way to treat data as a single social network using the USMF form implemented by Tawlk.


## Intro

kermitpfc-core is based on a series of classes to be used to ensure proper functionality of the social network you want to implement, these classes are Adapter to collect social network statuses, Converter to parse the previous statuses in the USMF model (with their respective classes). To facilitate the publish action of USMF, JSON service is used with the help of the Redis Pub / Sub module (which implements the core, Redis must be installed in server mode).


## How to use

KermitPFC-core has got a Twitter implementation for default and a Random Phrase Generator to mix the statuses, to use it:

First, you must fill the config.example.yml file with your personal data (Redis connection, SocialNetwork credentials, trackwords, ...) you can rename it as you want (config.yml could be a good name).

Then, you need have been installed a redis-server database (and actually running)

```bash
$ sudo apt-get install redis-server
```

and a ruby version to launch the application

```bash
$ sudo apt-get install ruby
```
Finally you only need to downlad the gem from the source (from github, rubygems,...) and install it

```bash
$ gem install kermit
```

* maybe you need permisions to install

and execute it

```bash
$ kermit --path [config.yml_path]
```
p.ex

```bash
$ kermit --path ../config/config.yml
```

or

```bash
$ kermit --path config.yml
```