#!/usr/bin/env ruby

# Submission for Ruby Christmas Contest (http://contest.dimelo.com/)
# Author: Adrien Jarthon (http://adrienjarthon.com)

data = {"login" => "defunkt",
        "followers" => 4674,
        "commits" => 8901,
        "repositories" => [{"watchers" => 79,  "forks" => 9, "name" => "choice"},
                           {"watchers" => 28,  "forks" => 1, "name" => "mapreducerb"},
                           {"watchers" => 16,  "forks" => 3, "name" => "ambitious_activerecord"},
                           {"watchers" => 151, "forks" => 39,  "name" => "emacs"},
                           {"watchers" => 787, "forks" => 116, "name" => "github-gem"},
                           {"watchers" => 1559,"forks" => 298, "name" => "facebox"},
                           {"watchers" => 2977,"forks" => 425, "name" => "resque"}]}

if ARGV.first
  rules = File.readlines ARGV.first
  follower = commit = repositories = 0
  eval rules.grep(/^(follower|commit)/).join
  repo_rules = rules.grep(/^repository/).join.gsub /repository.(\w+)/, "repo_data['\\1']"
  for repo_data in data['repositories']
    repository = 0
    eval repo_rules
    repositories += repository
  end
  puts follower*data['followers'] + commit*data['commits'] + repositories
else
  $stderr.puts "usage: #{$0} <rules-file>"
  exit 1
end
