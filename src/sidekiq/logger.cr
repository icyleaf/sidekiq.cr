require "logger"

module Sidekiq
  class Logger
    SPACE = " "

    def self.context
      c = Fiber.current.logging_context
      c && c.size > 0 ? " #{c.join(SPACE)}" : ""
    end

    def self.with_context(msg)
      Fiber.current.logging_context ||= [] of String
      Fiber.current.logging_context.not_nil! << msg
      yield
    ensure
      Fiber.current.logging_context.not_nil!.pop
    end

    def self.build(log_target = STDOUT)
      logger = ::Logger.new(log_target)
      logger.level = ::Logger::INFO
      logger.formatter = with_logger_format
      logger
    end

    private def self.with_logger_format
      ::Logger::Formatter.new do |severity, time, progname, message, io|
        unless ENV["DYNO"]?
          time.in(Sidekiq.default_timezone).to_s("%FT%T.%L%z", io)
          io << " "
        end
        io << ::Process.pid
        io << " TID-"
        Fiber.current.object_id.to_s(36, io)
        io << " "
        io << Sidekiq::Logger.context
        io << " "
        io << severity
        io << ": "
        io << message
      end
    end
  end
end

class Fiber
  property logging_context : Array(String)?
end
