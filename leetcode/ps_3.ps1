# Örnek girişler
$nums1 = 2, 4, 3  # 342 sayısını temsil eder
$nums2 = 5, 6, 4  # 465 sayısını temsil eder

# Dizileri ters çevirip birleştir
$nums1_reverse = @()
$nums2_reverse = @()

foreach ($num in $nums1) {
    $nums1_reverse = $num + $nums1_reverse
}

foreach ($num in $nums2) {
    $nums2_reverse = $num + $nums2_reverse
}

# Dizileri birleştirip integer'a dönüştür
$joinedStringNums1 = -join $nums1_reverse
$IntegerValueNums1 = [int]$joinedStringNums1

$joinedStringNums2 = -join $nums2_reverse
$IntegerValueNums2 = [int]$joinedStringNums2

# İki sayıyı topla
$sumNums = $IntegerValueNums1 + $IntegerValueNums2

# Sonucu ters çevirerek diziye dönüştür
$againarray = ($sumNums.ToString().ToCharArray() | ForEach-Object { [int]$_ })[:: -1]

# Sonucu yazdır
Write-Output $againarray
