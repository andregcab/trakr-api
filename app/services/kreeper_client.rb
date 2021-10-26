require "graphql/client"
require "graphql/client/http"
class KreeperClient
  # adapter
  KREEPER_API_URL = Rails.application.credentials[Rails.env.to_sym][:kreeper][:graphql_url]
  Adapter = GraphQL::Client::HTTP.new(KREEPER_API_URL) do
    def headers(_context)
      {"Authorization": "#{ Rails.application.credentials[Rails.env.to_sym][:kreeper][:app_read_token] }"}
    end
  end
  Schema = GraphQL::Client.load_schema(Adapter)
  Client = GraphQL::Client.new(schema: Schema, execute: Adapter)

  def self.normalize_response(data)
    convert_hash_keys(data)
  end
  def self.cache_schema path
    io = File.open(path, "w")
    GraphQL::Client.dump_schema(Adapter, io)
  end
  private
  def self.convert_hash_keys(value)
    case value
      when Array
        value.map { |v| convert_hash_keys(v) }
      when Hash
        Hash[value.map { |k, v| [underscore_key(k), convert_hash_keys(v)] }]
      else
        value
    end
  end
  def self.underscore_key(k)
    k.to_s.underscore.to_sym
  end
end