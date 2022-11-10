-- Remember: Text after two lines ( -- ) doesn't have to be translated, it just means it's a note or comment for extra context.

--- You can define genders in a translation
-- Use syntax: (male|female|neutral) or (male|female) [1st field is mandatory]
-- For example: "(King|Queen|Royalty) of Transformice", outputs: "Queen of Transformice" for female gender
-- It accepts long sentences and multiple options in a same sentence:
--	"The (man|woman|person) was playing (Jazz|Videogames|with their friends) at the station"
-- Output (for neutral/none: "The person was playing with their friends at the station"

Text["cn"] = {
	title = "管弦乐队",
	hey = {
		[1] = "欢迎来到活动!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"定音鼓", "我用踏板来调整我的乐器."},
		["cymbals"] 	= {"镲片", "我的乐器其实不需要调音."},
		["tubular_bells"] 	= {"管钟", "我的乐器也用于制作落地摆钟钟."}, 
		["vibraphone"] 	= {"颤音琴", "我的乐器甚至还没有100年的历史."}, 
		["marimba"] 	= {"马林巴琴", "我的乐器经常用紫檀木制作."}, 
		["horn"] 		= {"圆号", 	"英国人说我的乐器是法国的."}, 
		["trumpet"] 	= {"小号", "我的乐器能让耶利哥城墙颤抖."}, 
		["trombone"] 	= {"长号", 	"Don Drummond是个拥有我这种大乐器的人."}, 
		["tuba"] 		= {"大号", "我的乐器取代了管弦乐队中的长笛"}, 
		["euphonium"] 	= {"悠风号", "我的乐器名在希腊语中的意思是 '好听的声音'."}, 
		["flute"] 		= {"长笛", 	"我的乐器音色纤细,曾在Jethro Tull乐队的音乐中出现."},
		["oboe"] 		= {"双簧管", "芦笛是我的乐器的前身."},
		["clarinet"] 	= {"单簧管", "《蓝色狂想曲》以我的乐器的独奏开场."}, 
		["bassoon"] 	= {"巴松管", "我的乐器的吹口管叫做bocal."}, 
		["saxophone"] 	= {"萨克斯", "我的乐器适合演奏感性的音乐."},
		["violin"] 		= {"小提琴", "我的乐器的演奏者者可以成为整个管弦乐队的副手."}, 
		["viola"] 		= {"中提琴", "我的乐器是弦乐四重奏中的女性成员."}, 
		["cello"] 		= {"大提琴", "我在我的双腿之间演奏我的乐器."}, 
		["bass"] 		= {"贝斯", "我的弦乐器音比你高."}, 
		["harp"] 		= {"竖琴", 	"据说天使会弹奏我的乐器."} 
	},
	npcDialogs = {
		conductor = { -- Male
			name = "指挥",
			[-1] = {"..."},
			[1] = {
				[1] = "你终于来了! 我得让这个管弦乐队尽快准备好. 我不想让女歌手等, 当然也不想让奶酪之王等!",
				[2] = "行吧, 问一下每个音乐家他们的乐器是什么, 然后去后台拿. 他们还需要他们的乐谱, 把他们从那堆东西里面拿出来.",
				[3] = "我可怜的整齐书堆! 破坏者们...",
				[4] = "总之, 把乐谱带给每个音乐家, 给他们的乐器调音. 每个乐谱上都有相关的说明."
			},
			[2] = {
				[1] = "问一下每个音乐家他们的乐器是什么, 然后去后台拿. 他们还需要他们的乐谱, 把他们从那堆东西里面拿出来.",
				[2] = "把乐谱带给每个音乐家, 给他们的乐器调音. 每个乐谱上都有相关的说明."
			},
			[3] = {
				[1] = "你让大家都准备好了吗? 有用的东西! 我就知道靠你有用.",
				[2] = "现在是时候面对女歌手了... 我不嫉妒你.",
				[3] = "她开始紧张了,而且会传染的. 去吧, 她会教你怎么做. 这是她除了唱歌最喜欢做的事.",
				[4] = "剩下的靠我了, 祝你好运!"
			},
			[4] = {
				[1] = "干得好! 你现在可以坐下来欣赏表演了.",
				[2] = "别忘了把你的手机静音, 嗯哼?",
				[3] = "然后 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "女歌唱家",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "你在看啥, 你要我的签名吗?",
				[2] = "我没看到管弦乐队准备好! 别让一位女士等.",
				[3] = "我把我口袋的镜子放哪了..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "行吧, 你花了点时间, 我开始绝望了.",
				[2] = "Ok, 首先, 你能把我麦克风的线解开吗? 我穿成这样解不开."
			},
			[3] = {
				[1] = "你能把我麦克风的线解开吗? 我穿成这样解不开."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "我发誓, 我周围都是一群业余的... 总之, 你做得好啊. 让我们搞点艺术!",
				[2] = "专心点. 我唱我的部分, 你来伴奏.",
				[3] = "别犯错, 懂吗? 那么, 来吧!"
			},
			[5] = {
				[1] = "专心点. 我唱我的部分, 你来伴奏.",
				[2] = "别犯错, 懂吗? 那么, 来吧!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "干得漂亮! 你值得获得我们得到的掌声的一部分, 没有你我们就做不到这些.",
				[2] = "在庆祝酒会再见吧!"
			}
		},
		musician = {
			name = "音乐家",
			[-2] = {"我不能用这个乐谱调音."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"呃呃... 这不是我的乐器."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"我已经准备好演奏了!"}, -- When the player gives the correct instrument to the musician
			[3] = {"嗯... 我已经有我的乐器了."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"这就是我们的英雄!"}
		}
	},
	instruct = {
		microphone = "通过移动方块来解开麦克风的电缆.",
		insboard = "选择正确的乐器, 然后获取相匹配的乐谱.",
		scorepile = "选择正确的乐谱, 记住手势的顺序来为乐器调音.",
		piano = "重复女歌唱家刚刚唱过的曲子.",
		
		accept = "接受",
		reject = "拒绝",
		continue = "继续",
		cancel = "取消",
		search = "搜索",
		discard = "丢弃",
		start = "开始", -- As verb 'to start'
		finish = "完成", -- As verb 'to finish'
		riddle = "?" -- Clue or guess
	}
}