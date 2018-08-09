echo "window.ENV = `jo \`env | grep CREATE_APP_\` end=1`" > env.js
nginx -g "daemon off;"