module CheckCronHeader
  extend ActiveSupport::Concern

  CRON_HEADER = 'X-Appengine-Cron'

  def check_app_engine_cron
    render status: :internal_server_error unless request.headers[CRON_HEADER]
  end
end
