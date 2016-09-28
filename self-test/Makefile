PORT = 80
SIZE = 1000
all: headers resize bundle post-large


headers:
	@echo -n '{"owner":"Testing-testing","access":"public","licenseType":"CC BY","legend":"Dragon or pica-pica","fileName":"testing.jpg","taggar": ["view:flying", "country:sweden"],"fileDataBase64":"' > head.json
	@echo -n '"}' > tail.json

resize: dragon.gif
	@convert dragon.gif -resize ${SIZE} dragon.png

bundle: dragon.png
	@base64 dragon.png > dragon.b64
	@cat head.json dragon.b64 tail.json > big.b64

post-large: big.b64
	@echo "posting BIG"
	@curl -H "Accept: application/json" \
		-H "Content-type: application/json" -X POST \
		-d @big.b64 http://localhost:${PORT}/MediaServerResteasy/media/v1

post-small: picapica.b64
	@echo "posting SMALL"
	@curl -H "Accept: application/json" \
		-H "Content-type: application/json" -X POST \
		-d @picapica.b64 http://localhost:${PORT}/MediaServerResteasy/media/v1
	
clean:
	rm dragon.png dragon.b64 big.b64 head.json tail.json
