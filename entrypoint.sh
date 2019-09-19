echo "window.ENV = `jo \`env | grep REACT_APP_ | sed -e 's/[[:blank:]]/{_!!_}/g'\` end=1`" | sed -e 's/{_!!_}/ /g' > env.js
nginx -g "daemon off;"