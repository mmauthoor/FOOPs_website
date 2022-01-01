require "sinatra"
require "sinatra/reloader"
require "pg"
require "pry"

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
    erb(:join)
end

get "/projects" do
    erb(:projects)
end

get "/resources" do
    erb(:resources)
end

get "/edit" do
    sql = "SELECT * FROM dates ORDER BY id;"
    conn = PG.connect( dbname: 'foopswbdates')
    result = conn.exec(sql)
    conn.close

    erb(:dates, locals: {
        dates: result
    })
end

get "/edit_date/:id" do
    
    sql = "SELECT * FROM dates WHERE id = #{params["id"]};"
    conn = PG.connect( dbname: 'foopswbdates')
    result = conn.exec(sql)
    conn.close

    date = result[0]
    erb(:edit_date, locals: {
        date: date
    })
end

put "/update_date/:id" do

    date = params["date"]
    sql = "UPDATE dates SET date = '#{params["date"]}' WHERE id = #{params["id"]};"
    conn = PG.connect(dbname: 'foopswbdates')
    conn.exec(sql)
    conn.close
    # erb(:index, locals: {
    #     date_1: params["date_1"],
    #     date_2: params["date_2"],
    #     date_3: params["date_3"],
    #     date_4: params["date_4"],
    #     date_5: params["date_5"],
    #     date_6: params["date_6"]
    # })

    redirect "/edit"
    
end