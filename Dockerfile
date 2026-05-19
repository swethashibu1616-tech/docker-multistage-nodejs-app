# Build Stage
FROM node:18 AS builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

# Production Stage
FROM node:18-alpine

WORKDIR /app

RUN apk add --no-cache curl

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]