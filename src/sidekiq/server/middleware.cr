require "../middleware"
require "./retry_jobs"

class Sidekiq::Middleware::Logger < Sidekiq::Middleware::ServerEntry
  def call(job, ctx)
    Sidekiq::Logger.with_context("JID=#{job.jid}") do
      a = Time.now(Sidekiq.default_timezone).to_unix_f
      ctx.logger.info { "START {\"job\":\"#{job.klass}\",\"args\":#{job.args}}" }
      yield
      ctx.logger.info { "SUCCESS #{"%.6f" % (Time.now(Sidekiq.default_timezone).to_unix_f - a)} sec" }
      true
    end
  end
end
