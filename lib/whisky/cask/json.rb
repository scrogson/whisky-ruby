require 'multi_json'

module Whisky
  module Cask
    class Json

      def initialize(filename)
        basename = File.split(filename)[-1]
        id = File.basename(basename, ".json").to_i

        object = File.read(filename)
        @hash = MultiJson.load(object)
      end

      def [](key)
        @hash[key.to_s]
      end

      def []=(key, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          new("db/whiskies/#{id}.json")
        rescue MultiJson::LoadError => error
          raise error.message
        end
      end

      def self.all
        files = Dir["db/whiskies/*.json"]
        files.map { |f| new f }
      end

      def self.create(attributes = {})
        hash = {}
        hash["name"] = attributes["name"] || ""
        hash["age"] = attributes["name"] || ""

        files = Dir["db/whiskies/*.json"]
        names = files.map { |f| f.split("/")[-1] }
        id = names.map { |i| i[0...-5].to_i }.max + 1

        File.open("db/whiskies/#{id}.json", "w") do |f|
          f.write <<TEMPLATE
{
  "name": "#{hash["name"]}",
  "age": "#{hash["age"]}"
}
TEMPLATE
        end
        new("db/whiskies/#{id}.json")
      end
    end
  end
end
