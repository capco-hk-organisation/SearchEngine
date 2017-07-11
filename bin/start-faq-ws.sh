#!/usr/bin/env bash
echo "Cleaning up existing index..."
rm -rf ~/Downloads/slack/taming-text/book/apache-solr/solr-qa/data/index

echo "Starting FAQ webservice..."
~/Downloads/slack/taming-text/book/bin/start-solr.sh solr-qa &> ~/Downloads/slack/logs/solr.log &

echo "Waiting for 2 mins to let the webservice stablise"
sleep 2m

echo "Rebuilding index..."
cd ~/Downloads/slack/taming-text/book/bin/
sh indexWikipedia.sh --wikiFile faq.txt &> ~/Downloads/slack/logs/solr.log

echo "FAQ webservice started..."
cd ~
