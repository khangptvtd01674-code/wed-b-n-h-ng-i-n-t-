$images = @(
    @{ name = "product_1.jpg"; url = "https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_2.jpg"; url = "https://images.unsplash.com/photo-1595225476474-87563907a212?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_3.jpg"; url = "https://images.unsplash.com/photo-1583863788434-e58a36330cf0?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_4.jpg"; url = "https://images.unsplash.com/photo-1601999109332-542b18dbec7f?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_5.jpg"; url = "https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_6.jpg"; url = "https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_7.jpg"; url = "https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_8.jpg"; url = "https://images.unsplash.com/photo-1609091839311-d5365f9ff1c5?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_9.jpg"; url = "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_10.jpg"; url = "https://images.unsplash.com/photo-1590794056226-79ef3a8147e1?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_11.jpg"; url = "https://images.unsplash.com/photo-1611186871348-b1ce696e52c9?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_12.jpg"; url = "https://images.unsplash.com/photo-1616410011236-7a42121dd981?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_13.jpg"; url = "https://images.unsplash.com/photo-1615663245857-ac1eebc5d6e9?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_14.jpg"; url = "https://images.unsplash.com/photo-1585338107529-13afc5f02586?w=400&h=300&fit=crop&auto=format" },
    @{ name = "product_15.jpg"; url = "https://images.unsplash.com/photo-1629654297299-c8506221ca97?w=400&h=300&fit=crop&auto=format" }
)

$outputDir = ".\images"
if (!(Test-Path $outputDir)) { New-Item -ItemType Directory -Path $outputDir }

$client = New-Object System.Net.WebClient
$client.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36")

foreach ($img in $images) {
    $dest = Join-Path $outputDir $img.name
    try {
        Write-Host "Downloading $($img.name)..." -ForegroundColor Cyan
        $client.DownloadFile($img.url, $dest)
        Write-Host "  OK - $($img.name)" -ForegroundColor Green
    } catch {
        Write-Host "  FAILED - $($img.name): $_" -ForegroundColor Red
    }
}
$client.Dispose()
Write-Host "`nDone! Check images folder." -ForegroundColor Yellow
