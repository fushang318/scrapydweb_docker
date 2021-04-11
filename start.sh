cd /work/scrapyd
rm -rf /work/scrapyd/twistd.pid
nohup scrapyd -d . 2>&1 &

cd /work/scrapydweb
nohup scrapydweb 2>&1 &

while [[ true ]]; do
    sleep 1
done
