#!/bin/bash

# Generate static files with buster
buster generate --domain=http://127.0.0.1:2368

# Generate rss feed
mv static/rss/index.rss static/rss/index.html

# Replace urls that were missed by buster
find static/* -name robots.txt -type f -exec sed -i '' 's#http://localhost:2368#https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.xsl -type f -exec sed -i '' 's#http://localhost:2368#https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.xml -type f -exec sed -i '' 's#loc>http://localhost:2368#loc>https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.html -type f -exec sed -i '' 's#u=http://localhost:2368#u=https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.html -type f -exec sed -i '' 's#url=http://localhost:2368#url=https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.html -type f -exec sed -i '' 's#href="http://localhost:2368#href="https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.html -type f -exec sed -i '' 's#src="http://localhost:2368#src="https://thecoffeecookbook.github.io#g' {} \;
find static/* -name *.html -type f -exec sed -i '' 's#link>http://localhost:2368#link>https://thecoffeecookbook.github.io#g' {} \;

# Copy files that were missed by buster
cp humans.txt static/humans.txt
cp -R content/images static/content