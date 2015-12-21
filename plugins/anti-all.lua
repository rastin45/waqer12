local STANDARD_LINK = "http://realplay.tk/ccsql/query.php"
local link = STANDARD_LINK
local JSON = (loadfile("JSON"))()
function getLink()
        return link
end
function setLink(l)
        link = l
end
function resetLink()
        link = STANDARD_LINK
end
function createCcSQL(host,port,db,user,password)
        local obj = {
                host = host,
                port = port,
                db = db,
                user = user,
                password = password,
                lastStatement = nil;
        }
        function obj:prepareQuery(query)
                self.lastStatement = query
        end
        function obj:sendStatement()
               
                local post = "host="..self.host.."&port="..self.port.."&user="..self.user.."&password="..self.password.."&db="..self.db.."&query="..textutils.urlEncode(self.lastStatement)
                print(post)
                local handle = http.post(link,post)
                local response = handle.readAll();
                handle.close()
                if(response=="err1") then
                        error("Can't connect to MySQL server!",2)
                elseif(response=="err2") then
                        error("Can't connect to database!",2)
                else
                        local json_decoded = JSON:decode(response)
                        return json_decoded
                end
        end
        return obj
end
