module CheckCronHeader
  extend ActiveSupport::Concern

  CRON_HEADER = 'X-Appengine-Cron'.freeze

  def check_app_engine_cron
    head :internal_server_error unless request.headers[CRON_HEADER]
  end
end
