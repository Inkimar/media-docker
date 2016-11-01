HOST = beta-media.dina-web.net
SIZE = 1000

OUTPUT_FILE= output.json
all: headers resize bundle post-https firefox 
#clean


headers:
	@echo -n '{"owner":"Testing-testing","access":"public","licenseType":"CC BY","legend":"Dragon or pica-pica","fileName":"testing.jpg","taggar": ["view:flying", "country:sweden"],"fileDataBase64":"' > head.json
	@echo -n '"}' > tail.json

resize: dragon.gif
	@convert dragon.gif -resize ${SIZE} dragon.png

bundle: dragon.png
	@base64 dragon.png > dragon.b64
	@cat head.json dragon.b64 tail.json > big.b64


post-https: big.b64
	@echo "posting to HTTPS (does not re-route from http to https)"
	@curl -H "Accept: application/json" \
		-H "Content-type: application/json" -X POST \
		-d @big.b64 https://${HOST}/MediaServerResteasy/media | json_pp > ${OUTPUT_FILE}

firefox: ${OUTPUT_FILE}
	./inspect-image.sh

clean:
	rm dragon.png dragon.b64 big.b64 head.json tail.json  ${OUTPUT_FILE}
