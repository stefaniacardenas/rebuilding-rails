require "sqlite3"
require "runways/util"

DB = SQLite3::Database.new "test.db"

module Runways
  module Model
    class SQLite

      def initialize(data = nil)
        @hash = data
      end

      def self.to_sql(val)
        case val
          when Numeric
            val.to_s
          when String
            "'#{val}'"
          else
            raise "Can't change #{val.class} to SQL!"
        end
      end

      def self.create(values)
        values.delete "id"
        keys = schema.keys - ["id"]
        vals = keys.map do |key|
          values[key] ? to_sql(values[key]) : "null"
        end
        statement = <<SQL
INSERT INTO #{table} (#{keys.join ","}) VALUES (#{vals.join ","});
SQL
        puts statement
        DB.execute statement
        data = Hash[keys.zip vals]
        sql = "SELECT last_insert_rowid();"
        data["id"] = DB.execute(sql)[0][0]
        self.new data
      end

      def self.count
        DB.execute(<<SQL)[0][0]
        SELECT COUNT(*) FROM #{table}
SQL
      end

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