function Check-SpecialSubarrays {
    param (
        [int[]]$nums,
        [int[][]]$queries
    )
    
    $result = @()
    
    # Subarray'yı kontrol eden fonksiyon
    function Is-SpecialSubarray {
        param (
            [int[]]$subarray
        )
        
        for ($i = 0; $i -lt $subarray.Length - 1; $i++) {
            if (($subarray[$i] % 2) -eq ($subarray[$i + 1] % 2)) {
                return $false
            }
        }
        return $true
    }
    
    # Her bir sorguyu kontrol et
    foreach ($query in $queries) {
        $fromIndex = $query[0]
        $toIndex = $query[1]
        
        $subarray = $nums[$fromIndex..$toIndex]
        
        # Alt diziyi kontrol et ve sonucu ekle
        $result += Is-SpecialSubarray -subarray $subarray
    }
    
    return $result
}

# Örnek kullanımlar
$nums1 = @(3, 4, 1, 2, 6)
$queries1 = @(@(0, 4))
$output1 = Check-SpecialSubarrays -nums $nums1 -queries $queries1
Write-Output $output1  # [false]

$nums2 = @(4, 3, 1, 6)
$queries2 = @(@(0, 2), @(2, 3))
$output2 = Check-SpecialSubarrays -nums $nums2 -queries $queries2
Write-Output $output2  # [false, true]
