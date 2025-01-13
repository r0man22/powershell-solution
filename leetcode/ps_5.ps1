function Get-BinaryArray {
    while ($true) {
        $inputArray = Read-Host "A sequence of only 0s and 1s"
        if ($inputArray -match '^[01]+$') {
            return $inputArray
        } else {
            Write-Host "Invalid entry"
        }
    }
}

function Get-ParenthesisArray {
    while ($true) {
        $inputArray = Read-Host "A array of parentheses only"
        if ($inputArray -match '^[\(\)]+$') {
            return $inputArray
        } else {
            Write-Host "Invalid entry"
        }
    }
}

function Adjust-ArrayLengths {
    $binaryArray = Get-BinaryArray
    $parenthesisArray = Get-ParenthesisArray

    # Ensure lengths are the same
    if ($binaryArray.Length -eq $parenthesisArray.Length) {
        return @($binaryArray, $parenthesisArray)
    } else {
        if ($binaryArray.Length -gt $parenthesisArray.Length) {
            $binaryArray = $binaryArray.Substring(0, $parenthesisArray.Length)
        } elseif ($parenthesisArray.Length -gt $binaryArray.Length) {
            $parenthesisArray = $parenthesisArray.Substring(0, $binaryArray.Length)
        }
        return @($binaryArray, $parenthesisArray)
    }
}

# Get adjusted arrays
$binaryArray, $parenthesisArray = Adjust-ArrayLengths

$openBalance = 0
$test = 0

# Check from left to right
for ($i = 0; $i -lt $parenthesisArray.Length; $i++) {
    if ($binaryArray[$i] -eq "0") {
        $openBalance += 1
    } elseif ($parenthesisArray[$i] -eq "(") {
        $openBalance += 1
    } else {
        $openBalance -= 1
    }

    # If openBalance goes negative, it's invalid
    if ($openBalance -lt 0) {
        $test = 1
    }
}

$closeBalance = 0

# Check from right to left
for ($i = $parenthesisArray.Length - 1; $i -ge 0; $i--) {
    if ($binaryArray[$i] -eq "0") {
        $closeBalance += 1
    } elseif ($parenthesisArray[$i] -eq ")") {
        $closeBalance += 1
    } else {
        $closeBalance -= 1
    }

    # If closeBalance goes negative, it's invalid
    if ($closeBalance -lt 0) {
        $test = 1
    }
}

# Print the result
if ($test -gt 0) {
    Write-Host "False"
} else {
    Write-Host "True"
}
