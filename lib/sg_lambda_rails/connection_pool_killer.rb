unless ENV['IGNORE_CONNECTION_POOL_KILLER']
  require "active_record"

  module SgLambdaRails::ConnectionPoolKiller
    def checkout(_checkout_timeout = nil)
      c = new_connection
      begin
        c.pool = self
        c.verify!
        c
      rescue
        c.disconnect!
        raise
      end
    end

    def checkin(conn)
      conn.disconnect!
    end
  end

  class ActiveRecord::ConnectionAdapters::ConnectionPool
    prepend SgLambdaRails::ConnectionPoolKiller
  end
end
