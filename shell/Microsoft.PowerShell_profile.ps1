Function Deno-Run {
	$strExpression = "podman run -it --rm --volume ${home}/.deno:/deno-dir --volume ${pwd}:/app --workdir /app denoland/deno:latest ${args}"
	echo $strExpression
 	Invoke-Expression $strExpression
}

Function Kali-Linux {
	$strExpression = "podman run -it --rm --volume ${pwd}:/home --workdir /home kali:1.0.0 bash"
	echo $strExpression
 	Invoke-Expression $strExpression
}

Function Arch-Linux {
	$strExpression = "podman run -it --rm --volume ${pwd}:/home --workdir /home docker.io/library/archlinux:latest bash"
	echo $strExpression
 	Invoke-Expression $strExpression
}
