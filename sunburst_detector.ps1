$Files = ls -r \ 2>null
Foreach ($file in $Files)
{
	$size=[math]::floor($file.length / 100Mb)
	if ($size -eq 0){
		$hash = (get-filehash -path $file.fullname).hash
		if ($hash){
			if (gc .\hashes.txt | sls -pattern $hash){
			echo $file.fullname
			}
	}	
	}
}