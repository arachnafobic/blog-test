$redis = Redis::Namespace.new("myblog_app", :redis => Redis.new(port: 9990))
