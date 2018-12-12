require "./sidekiq/version"
require "./sidekiq/pool"
require "./sidekiq/job"
require "./sidekiq/middleware"
require "./sidekiq/types"
require "./sidekiq/client"
require "./sidekiq/worker"
require "./sidekiq/logger"

module Sidekiq
  NAME    = "Sidekiq"
  LICENSE = "Licensed for use under the terms of the GNU LGPL-3.0 license."

  TIMEZONE = "UTC"
  class_getter default_timezone : Time::Location = Time::Location.load(TIMEZONE)

  def self.default_timezone=(timezone : String)
    @@default_timezone = Time::Location.load timezone
  end

  def self.redis
    Sidekiq::Client.default_context.pool.redis do |conn|
      yield conn
    end
  end
end
