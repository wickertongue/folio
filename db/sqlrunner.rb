require('pg')
require('rubygems')
require('bundler/setup')


class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'inventory', host: 'localhost' })

      db = PG.connect({ dbname: 'd394nl18js8esc', host: 'ec2-174-129-43-40.compute-1.amazonaws.com', port: 5432, user: 'eqzgfecnzkkejo', password: '416324330abcb2c7f87f22e95e936d213eb68e37efd98abdc6e30d5760cd138e' })

      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
