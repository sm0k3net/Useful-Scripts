@echo off
for /f "delims=" %%a in (ip.txt) do (
	Echo+
	Echo [+] Checking IP: %%a
	query user /server:%%a  2>null | find /N "0" && (
	Echo [ Success! ]) || (
	Echo [ Failed to check ])
	)
