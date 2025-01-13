$input1 = Read-Host "Enter the first sorted array (comma-separated)"
$input2 = Read-Host "Enter the second sorted array (comma-separated)"

# Convert the input strings into integer arrays
$nums1 = $input1 -split ',' | ForEach-Object { [int]$_ }
$nums2 = $input2 -split ',' | ForEach-Object { [int]$_ }

# Merge the two arrays
$combined = $nums1 + $nums2

# Sort the combined array
$sorted = $combined | Sort-Object

# Get the length of the sorted array
$n = $sorted.Length

# Calculate the median
if ($n % 2 -eq 0) {
    # If the length is even, take the average of the two middle numbers
    $median = ($sorted[$n/2 - 1] + $sorted[$n/2]) / 2
} else {
    # If the length is odd, take the middle number
    $median = $sorted[([math]::Floor($n / 2))]
}

Write-Host "Median: $median"
