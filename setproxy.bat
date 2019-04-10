@echo off

if "%1%" == "-c" (
	echo Clean Proxy Settings
	goto clean
) else (
	echo Set Proxy Settings
	set /p proxyaddress=Enter Proxy Address/IP:Port :
	goto set
)		

:set
	echo Set proxy address to %proxyaddress%
	set HTTP_PROXY=%proxyaddress%		
	set HTTPS_PROXY=%proxyaddress%	
	git config --global http.proxy %proxyaddress%		
	git config --global https.proxy %proxyaddress%
	goto end

:clean
	set HTTP_PROXY=		
	set HTTPS_PROXY=	
	git config --global --unset http.proxy
	git config --global --unset https.proxy

:end
@cmd
pause
