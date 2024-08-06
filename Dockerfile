FROM alpine

RUN set -eux; \
	\
	apk add --no-cache nodejs npm; \
	\
	npm config set registry https://registry.npmmirror.com; \
	\
	npx create-koishi@latest koishi_temp --yes

COPY ./entrypoint.sh /
VOLUME ["/koishi"]
WORKDIR "/koishi"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm", "run", "dev"]
