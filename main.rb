require "sinatra"
require "sinatra/reloader"
require "pg"
require "pry"

# need to create login route to check user login against database

get "/" do

    conn = PG.connect( dbname: 'foopswbdates')
    sql = "SELECT * FROM dates ORDER BY id;"
    result = conn.exec(sql)
    conn.close
    erb(:index, locals: {
       dates: result
    })
end

get "/about" do
    erb(:about)
end

get "/join" do
    conn = PG.connect( dbname: 'foopswbdates')
    sql = "SELECT * FROM dates ORDER BY id;"
    result = conn.exec(sql)
    conn.close
    erb(:join, locals: {
        dates: result
    })
end

get "/projects" do
    erb(:projects)
end

get "/resources" do
    erb(:resources)
end

# should only be able to access this route via login page for site admin
# In database, change 'name' to 'month'
get "/wbdates" do
    sql = "SELECT * FROM dates ORDER BY id;"
    conn = PG.connect( dbname: 'foopswbdates')
    result = conn.exec(sql)
    conn.close

    erb(:dates, locals: {
        dates: result
    })
end

get "/wbdates/:id/edit" do
    
    sql = "SELECT * FROM dates WHERE id = #{params["id"]};"
    conn = PG.connect( dbname: 'foopswbdates')
    result = conn.exec(sql)
    conn.close

    date = result[0]
    erb(:edit_date, locals: {
        date: date
    })
end

put "/wbdates/:id" do

    date = params["date"]
    sql = "UPDATE dates SET date = '#{params["date"]}' WHERE id = #{params["id"]};"
    conn = PG.connect(dbname: 'foopswbdates')
    conn.exec(sql)
    conn.close

    redirect "/wbdates"
    
end