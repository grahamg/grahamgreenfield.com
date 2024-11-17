# Use an official Ruby runtime as a parent image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the rest of your application code
COPY . .

# Expose port 4000 to the host
EXPOSE 4000

# Run Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
