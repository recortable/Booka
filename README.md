# Plataforma booka

This is the Rails 3.1 application for plataformabooka.net

## For developers

### Cucumber, Rspec and Spork

Prepare test environment database:
{{{
> RAILS_ENV=test rake db:setup
}}}
Start Spork server using Guard:
{{{
> guard
}}}
you should see:
{{{
Spork is ready and listening on 8990!
Spork is ready and listening on 8989!
}}}
Run cucumber features:
{{{
> cucumber -p all
}}}
(Using the profile all because the default profile only run features tagged with @current)


