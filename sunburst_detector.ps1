write-output "Finding all files with size less than 100MB `n"
$Files = ls -r \ 2>null

$i = 0
Foreach ($file in $Files)
{
	$size=[math]::floor($file.length / 100Mb)
	if ($size -eq 0){
		$i+=1
	}
}
write-output ("Total Found "+ $i + " files `n")

write-output ("Finding suspicious SHA256 Hashes `n")

Foreach ($file in $Files)
{
	$size=[math]::floor($file.length / 100Mb)
	if ($size -eq 0){
		$sha2hash = (get-filehash -path $file.fullname -algorithm sha256).hash 2>null
		if ($sha2hash){
			if (gc .\sunburst_hashes.txt | sls -pattern $sha2hash){
			write-output ("Found Suspicious File at " + $file.fullname + "`n")
			}
		}
	}
}

write-output ("Finding suspicious SHA1 Hashes `n")

Foreach ($file in $Files)
{
	$size=[math]::floor($file.length / 100Mb)
	if ($size -eq 0){
		$sha1hash = (get-filehash -path $file.fullname -algorithm sha1).hash 2>null
		if ($sha1hash){
			if (gc .\sunburst_hashes.txt | sls -pattern $sha1hash){
			write-output ("Found Suspicious File at " + $file.fullname + "`n")
			}
		}
	}
}

write-output ("Finding suspicious MD5 Hashes `n")

Foreach ($file in $Files)
{
	$size=[math]::floor($file.length / 100Mb)
	if ($size -eq 0){
		$md5hash = (get-filehash -path $file.fullname -algorithm md5).hash 2>null
		if ($md5hash){
			if (gc .\sunburst_hashes.txt | sls -pattern $md5hash){
			write-output ("Found Suspicious File at " + $file.fullname + "`n")
			}
		}
	}
}
