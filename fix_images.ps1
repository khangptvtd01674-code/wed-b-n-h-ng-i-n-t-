$c = New-Object System.Net.WebClient
$c.Headers.Add("User-Agent", "Mozilla/5.0")
$c.DownloadFile("https://images.unsplash.com/photo-1609619385002-f40f1df9b7eb?w=400&h=300&fit=crop&auto=format", "images\product_4.jpg")
Write-Host "product_4 OK" -ForegroundColor Green
$c.DownloadFile("https://images.unsplash.com/photo-1586953208448-b95a79798f07?w=400&h=300&fit=crop&auto=format", "images\product_13.jpg")
Write-Host "product_13 OK" -ForegroundColor Green
