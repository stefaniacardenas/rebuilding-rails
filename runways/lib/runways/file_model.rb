require "multi_json"

module Runways
  module Model
    class FileModel

      def initialize(filename)
        @filename = filename
        # Split the filename on slashes on Unix or Mac, and split on backslashes on Windows. Then grab the final piece
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i

        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          FileModel.new("db/quotes/#{id}.json")
        rescue
          return nil
        end
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new f}
      end

    end
  end
end