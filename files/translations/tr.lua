Text["tr"] = {
	title = "Müzik Orkestrası",
	hey = {
		[1] = "Etkinliğe hoş geldiniz!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timpani", 		"Estrümanımı akort etmek için bir pedal kullanıyorum."}, -- Male
		["cymbals"] 	= {"Zil", 		"Benim enstrümanımı akort etmeye gerek yok."}, -- Female
		["tubular_bells"] 		= {"Boru çan(Tubular bells)", 			"Benim enstrümanım aynı zamanda sarkaçlı duvar saatlerinde kullanılıyor."}, -- Male
		["vibraphone"] 	= {"Vibrafon", 	"Benim enstrümanım henüz 100 yaşında bile değil."}, -- Female
		["marimba"] 	= {"Marimba", 		"Gül ağacı benim enstrümanımı yapmak için sıklıkla kullanılır."}, -- Female
		
		["horn"] 		= {"Korno", 			"İngilizler benim enstrümanımın fransız olduğunu iddia ediyor."}, -- Male
		["trumpet"] 	= {"Trampet", 		"Benim enstrümanım duvarları Jericho gibi bangırtabilir."}, -- Female
		["trombone"] 	= {"Trombon", 		"Don Drummond benimki kadar büyük enstrümanı olan bir adamdı."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Benim enstrümanım orkestradaki ofiklidin yerine geldi."}, -- Neutral
		["euphonium"] 	= {"Efanyum", 	"Benim müzik aletimin ismi Yunancada \"güzel sesli\" anlamına geliyor."}, -- Male
		
		["flute"] 		= {"Flüt", 		"Benimki Jethro Tull müziğinde bulunan ince bir enstrümandır."}, -- Neutral
		["oboe"] 		= {"Obua", 			"Benim enstrümanımın atası shawm,dır."}, -- Female
		["clarinet"] 	= {"Klarnet", 		"Rhapsody in Blue benim enstrümanımın bir solosuyla başlıyor."}, -- Female
		["bassoon"] 	= {"Fagot", 		"Benim enstrümanımın ağızlığına bokal(bocal) denir."}, -- Male
		["saxophone"] 	= {"Saksofon", 	"Benim enstrümanım şehvetli müzik için idealdir."}, -- Male
		
		["violin"] 		= {"Keman", 		"Enstrümanımla tüm orkestranın ikinci yöneticisi olabilirim."}, -- Male
		["viola"] 		= {"Viyola", 		"Benim yaylı enstrümanım ender bulunan do anahtarını kullanır."}, -- Female
		["cello"] 		= {"Çello", 		"Enstrümanımı çalarken onu sandalyeme yaslarım ve bir yay kullanırım."}, -- Female
		["bass"] 		= {"Bas", 			"Benim yaylı enstrümanım senden daha uzun."}, -- Male
		["harp"] 		= {"Arp", 			"Güya, melekler de benim enstrümanımdan çalıyormuş."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Orkestra Şefi",
			[-1] = {"..."},
			[1] = {
				[1] = "Sonunda, işte buradasın! Bu orkestanın olabildiğince hızlı şekilde hazır olmasına ihtiyacım var. Diva'nın beklesini asla istemiyorum ve elbette Kral Fromagnus'un da!",
				[2] = "Pekala, tüm müzisyenlere enstrümanlarını sor ve kulisten onları gidip getir. Aynı zamanda müzik skolarına da ihtiyaçları var, onları şurdaki... istiften getir.",
				[3] = "Benim zavallı düzenli yığınlarım! Vandallar...",
				[4] = "Her neyse, enstrümanlarını çalmaları için her bir müzisyenin müzik skorunu getir. Her bir skorda onlarla alakalı bir yönerge bulunuyor."
			},
			[2] = {
				[1] = "Tüm müzisyenlere enstrümanlarını sor ve kulisten onları gidip getir. Aynı zamanda müzik skolarına da ihtiyaçları var, onları şurdaki istiften getir.",
				[2] = "Enstrümanlarını çalmaları için her bir müzisyenin müzik skorunu getir. Her bir skorda onlarla alakalı bir yönerge bulunuyor."
			},
			[3] = {
				[1] = "Herkes hazır mı millet? İyi fare! Seni bu işe dahil edebileceğimi biliyordum.",
				[2] = "Şimdi, Diva ile yüzleşme vakti geldi... Seni kıskanmıyorum.",
				[3] = "Gittikçe sinirleniyor ve bu yayılıyor. Git, o ne yapman gerektiğini söyleyecek. Bu onun yapmayı en çok sevdiği ikinci şey, şarkı söylemekten sonra.",
				[4] = "Geri kalanıyla ben ilgileneceğim. Bol şans!"
			},
			[4] = {
				[1] = "Harika işti! Şimdi koltuğuna oturup şovun tadını çıkarabilirsin.",
				[2] = "Akıllı telefonunun sesini kapatmayı unutmadın, değil mi?",
				[3] = "Veee 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Ne bakıyorsun, imza mı istiyorsun?",
				[2] = "Orkestranın hazır olduğunu görmüyorum! Hiçbir leydiyi bekletmeyin.",
				[3] = "Şimdi, cep aynamı nereye koymuştum..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Peki, bu seni bir süre oyaladı, ümidimi kaybetmeye başlamıştım.",
				[2] = "Tamam, ilk olarak, mikrofonumun kablosunu açabilir misin? Bu elbisenin içinde bunu yapamıyorum."
			},
			[3] = {
				[1] = "Mikrofonumun kablosunu açabilir misin? Bu elbisenin içinde bunu yapamıyorum."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Yemin ederim amatörler tarafından etrafım sarılmış... Her neyse, iyi işti. Hadi biraz sanat yapalım!",
				[2] = "Şimdi odaklan. Kendi kısmımı söyleyeceğim ve sen de piyanoda bana eşlik et.",
				[3] = "Hata yapma, anladın mı? Öyleyse, hadi yapalım!"
			},
			[5] = {
				[1] = "Şimdi odaklan. Kendi kısmımı söyleyeceğim ve sen de piyanoda bana eşlik et.",
				[2] = "Hata yapma, anladın mı? Öyleyse, hadi yapalım!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Tebrikler! Aldığımız alkışların birazını da sen hak ettin, sen olmadan bu işi başaramazdık.",
				[2] = "Parti sonrasında görüşürüz!"
			}
		},
		musician = {
			name = "Müzisyen",
			[-2] = {"Bu skorla enstrümanımı çalamam."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Imm... Bu benim enstrümanım değil."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Konsere hazırım!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Benim zaten bir enstrümanım var."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"İşte kahramanımız!"}
		}
	},
	instruct = {
		microphone = "Blokları hareket ettirerek mikrofonun kablosunu çöz.",
		insboard = "Doğru müzik enstrümanını seçin, sonra eşleşen müzik skorunu gidip getir.",
		scorepile = "Enstrümanı çalmak içi doğru müzik kaydını seç ve jestlerin sırasını aklında tut.",
		piano = "Diva'nın az önce söylediği melodiyi tekrar et.",
		
		accept = "Kabul",
		reject = "Red",
		continue = "Devam",
		cancel = "İptal",
		search = "Ara",
		discard = "Kurtul",
		start = "Başlatmak", -- As verb 'to start'
		finish = "Bitirmek", -- As verb 'to finish'
		riddle = "Bilmece" -- Clue or guess
	}
}