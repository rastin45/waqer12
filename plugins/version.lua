do

function run(msg, matches)
  return 'Telegram Bot '.. VERSION .. [[ 
no version _no fuzuli _bilakh sicktir .com  @rastin44 for more info.]]
end

return {
  description = "Shows bot version", 
  usage = "!version: Shows bot version",
  patterns = {
    "^!version$"
  }, 
  run = run 
}

end
