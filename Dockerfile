FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# 运行阶段
FROM node:alpine

WORKDIR "/app"

COPY --from=builder /app /app
RUN npm install --only=production

EXPOSE 3000

CMD ["npm", "run", "start"]
# FROM nginx
# COPY --from=builder /app/.next /usr/share/nginx/html



