require 'pg'

def test_database_setup

  connection = PG.connect(dbname: 'users_test')

  connection.exec("DROP TABLE users;")

  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR, email VARCHAR, password VARCHAR);")

end
