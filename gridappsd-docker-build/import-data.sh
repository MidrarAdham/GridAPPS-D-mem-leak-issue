curl -X POST \
  --data-binary @dataloader.txt \
  --header 'Content-Type:application/xml' \
  http://localhost:8889/bigdata/dataloader
