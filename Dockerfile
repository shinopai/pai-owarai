FROM ruby:3.1

RUN mkdir /pai-owarai
WORKDIR /pai-owarai
COPY Gemfile /pai-owarai/Gemfile
COPY Gemfile.lock /pai-owarai/Gemfile.lock
RUN bundle install
COPY . /pai-owarai

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
