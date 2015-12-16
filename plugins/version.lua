do

function run(msg, matches)
  return 'Telegram Bot '.. VERSION .. [[ 
فوضولی ممنوع .کام   GNU GPL v2 license.
  @rastin44 for more info.]]
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
