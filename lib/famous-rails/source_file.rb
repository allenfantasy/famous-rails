require "thor"
require "json"
require "httpclient"

class SourceFile < Thor
  include Thor::Actions

  desc "fetch source files", "fetch source files from GitHub"
  # file_paths should be like:
  # {
  #   "minified/intro.min.js" => "javascripts/introjs.js",
  #   "minified/introjs.min.css" => "stylesheets/introjs.css"
  # }
  def fetch(owner, repo, file_paths)
    filtered_tags = fetch_tags(owner, repo)
    tag = select("Which tag do you want to fetch?", filtered_tags)
    self.destination_root = "vendor/assets"
    remote = "https://github.com/#{owner}/#{repo}"

    file_paths.each do |key, value|
      begin
        get "#{remote}/raw/#{tag}/#{key}", value
      rescue OpenURI::HTTPError
        get "#{remote}/raw/v#{tag}/#{key}", value # quirk raw path
      end
    end
  end

  private

  def fetch_tags(owner, repo)
    http = HTTPClient.new
    response = JSON.parse(http.get("https://api.github.com/repos/#{owner}/#{repo}/tags").body)
    response.map{|tag| tag["name"]}.sort
  end

  def select msg, elements
    elements.each_with_index do |element, index|
      say(block_given? ? yield(element, index + 1) : ("#{index + 1}. #{element.to_s}"))
    end
    result = ask(msg).to_i
    elements[result - 1]
  end
end
