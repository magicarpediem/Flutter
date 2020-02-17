import wget
for x in range(1,810):
	num = str(x)
	if(x < 10):
		num = "00" + num;
	elif (x<100):
		num = "0" + num;
	url = "https://assets.pokemon.com/assets/cms2/img/pokedex/detail/"+num+".png"
	print(url)
	wget.download(url)

