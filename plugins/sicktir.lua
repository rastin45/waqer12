local function run(msg)
if msg.text == "hi" then
	return "سلام خوش اومدی "
end
if msg.text == "Hi" then
	return "سلام خوش اومدی "
end
if msg.text == "Hello" then
	return "Hi bb"
end
if msg.text == "hello" then
	return "Hi honey"
end
if msg.text == "Salam" then
	return "Salam aleykom"
end
if msg.text == "salam" then
	return "گیریم سلام بعدش ؟"
end
if msg.text == "zac" then
	return "زاک رو که هزار بار گاییدم"
end
if msg.text == "Zac" then
	return "زاک که ننش زیرمه "
end
if msg.text == "ZAC" then
	return "برا شما بزنه ساک "
end
if msg.text == "Umbrella" then
	return "Yes?"
end
if msg.text == "umbrella" then
	return "رباتی که از ما اسکی رفت ؟"
end
if msg.text == "bot" then
	return "چیه ؟"
end
if msg.text == "Bot" then
	return "بناللللللل دیگ "
end
if msg.text == "?" then
	return "؟ این چیه اخه "
end
if msg.text == "Bye" then
	return "بسلامت "
end
if msg.text == "bye" then
	return "Bye Bye"
end
if msg.text == "kosenanat" then
	return "کس ننه خودت مادر جنده "
end
if msg.text =="Kosenanat" then 
	return " کس ننه خودت مادر جنده "
end
if msg.text == "madar jende" then 
	return " جنده ننته خارکونی "
end 
if msg.text == " ننتو گاییدم " then 
	return " ننت که الان میگاییدم بیا جمش کن "
end 
if msg.text == " کیر " then 
	return " دلت میخواد ؟"
end 
if msg.text == " خوبی آبجی ؟" then 
	return " کص لیسی ممنوع " 
end 
if msg.text == " mafia" then 
	return " مافیا ک همشون چوس ممبر گاییدن نداره چچچ "
end
if msg.text == " MAFIA" then 
	return " مافیا که همشون چوس ممبر گاییدن نداره چچچ "
end
end
return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Hh]i$",
		"^[Kk]osenanat$",
		"^[Mm]afia$,
		"^[Hh]ello$",
		"^[Zz]ac$",
		"^ZAC$",
		"^[Bb]ot$",
		"^[Uu]mbrella$",
		"^[Bb]ye$",
		"^?$",
		"^[Ss]alam$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
