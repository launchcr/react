require "log"
require "jennifer"
require "jennifer_sqlite3_adapter"
# require "jennifer/adapter/postgres" # for PostgreSQL
# require "jennifer/adapter/mysql" for MySQL

APP_ENV = ENV["LAUNCH_ENV"]? || "development"
Jennifer::Config.read("config/database.yml", APP_ENV)
Jennifer::Config.from_uri(ENV["DATABASE_URI"]) if ENV.has_key?("DATABASE_URI")

Jennifer::Config.configure do |conf|
  conf.logger.level = APP_ENV == "development" ? Log::Severity::Debug : Log::Severity::Error
end
