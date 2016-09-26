all: headers resize bundle post


headers:
	@echo -n '{"owner":"ingimar","access":"public","licenseType":"CC BY","legend":"Flying pica pica","fileName":"pica-pica-fly.jpg","taggar": ["view:flying", "country:sweden"],"fileDataBase64":"' > head.json
	@echo -n '"}' > tail.json

resize: dragon.gif
	@convert dragon.gif -resize 10000 dragon.png

bundle: dragon.png
	@base64 dragon.png > dragon.b64
	@cat head.json dragon.b64 tail.json > big.b64

post: big.b64
	@curl -H "Accept: application/json" \
		-H "Content-type: application/json" -X POST \
		-d @big.b64 http://localhost:18080/MediaServerResteasy/media

post2: picapica.b64
	@curl -H "Accept: application/json" \
		-H "Content-type: application/json" -X POST \
		-d @picapica.b64 http://localhost:18080/MediaServerResteasy/media
	
clean:
	rm dragon.png dragon.b64 big.b64 head.json tail.json
