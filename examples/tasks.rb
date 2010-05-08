# encoding: utf-8

# async: EM, em-http-request
# 101tasks GH

# create an anonymous client
client = Tasks::Client.new
key = client.register("botanicus")

# create an anonymous client
client = Tasks::Client.new("botanicus", "key")
client.projects.all
client.projects.create
