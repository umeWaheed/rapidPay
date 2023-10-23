set :environment, "development"
set :output, {:error => "log/cron_error_log.log" , :standard => "log/cron_log.log" }

every 1.hour do
  runner "UpdateFeeJob.perform_async"
end
