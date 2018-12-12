module Sidekiq
  module EpochConverter
    # https://github.com/crystal-lang/crystal/issues/2643
    def self.to_json(value : Time, builder : JSON::Builder)
      builder.number value.in(Sidekiq.default_timezone).to_unix_f
    end

    def self.from_json(value : JSON::PullParser) : Time
      Time.unix_ms((value.read_float * 1000).to_i64).in(Sidekiq.default_timezone)
    end
  end
end
