require "sqlite3"
require "runways/util"

DB = SQLite3::Database.new "test.db"

module Runways
  module Model
    class SQLite
      def self.table
        Runways.to_underscore name
      end

      def self.schema
        return @schema if @schema
        @schema = {}
        # we call table_info to get the schema. For each row we take the name and type
        DB.table_info(table) do | row |
          @schema[row["name"]] = row["type"]
        end
        @schema
      end

    end
  end
end