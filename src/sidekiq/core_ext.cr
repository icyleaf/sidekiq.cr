module Sidekiq
  module EpochConverter
    RFC33339_FORMAT = "%FT%H:%M:%S.%N%:z"

    # https://github.com/crystal-lang/crystal/issues/2643
    def self.to_json(value : Time, builder : JSON::Builder)
      builder.string value.in(Sidekiq.default_timezone).to_s(RFC33339_FORMAT)
    end

    def self.from_json(value : JSON::PullParser) : Time
      Time.parse(value.read_string, RFC33339_FORMAT, Sidekiq.default_timezone)
    rescue
      # Compatible with old version
      Time.unix_ms((value.read_float * 1000).to_i64).in(Sidekiq.default_timezone)
    end
  end
end
