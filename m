From: Erik Slagter <erik@slagter.name>
Subject: Re: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get freq
 feedback from hardware
Date: Mon, 25 Sep 2006 15:14:16 +0200
Message-ID: <4517D628.4090100@slagter.name>
References: <20060922172824.B811@unix-os.sc.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1267219461=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20060922172824.B811@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

This is a cryptographically signed message in MIME format.

--===============1267219461==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms070201080303090309020206"

This is a cryptographically signed message in MIME format.

--------------ms070201080303090309020206
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Venkatesh Pallipadi wrote:
> 
> Enable ondemand governor and acpi-cpufreq to use IA32_APERF and IA32_MPERF MSR
> to get active frequency feedback for the last sampling interval. This will
> make ondemand take right frequency decisions when hardware coordination of
> frequency is going on.

Does this mean there is actually no real clean approach to determine the
current cpu speed?

--------------ms070201080303090309020206
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJUTCC
AwMwggJsoAMCAQICEE+Yma8GCj4zbjwCYATQld8wDQYJKoZIhvcNAQEFBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDgxNjExNDIxM1oX
DTA3MDgxNjExNDIxM1owajEQMA4GA1UEBBMHU2xhZ3RlcjEVMBMGA1UEKhMMRXJpayBNYXJ0
aWpuMR0wGwYDVQQDExRFcmlrIE1hcnRpam4gU2xhZ3RlcjEgMB4GCSqGSIb3DQEJARYRZXJp
a0BzbGFndGVyLm5hbWUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCxMjf6bCZi
rNYgUJk3W0OcpsJAur5A1ipViPrdYD9CQa2eT3flPhd7nbUbg/Ck0Vfz/nSLCbi3aQzwXVKB
nqwhwYFmnIH6ZqEZarOChqSa1aZgtEk0XIyYuVHWjnmEQtYW7fHx77/nC9QVPE7yVxw9hw9E
xOKHA4mNLNE6A2NAyPAj2pQlGVsvjMLoT3WJw9h9xGT8ECxOilbwMHhO3iDNcbZpim7bb6wW
tA1Eq2HxVi16qdiVE118LyHq9NWpSqYWnw68cAR0m1+S0U7Y9MPPvubcX5u2+SUQ6u2X0Qxf
PX5DVKrYwJ+a0GCqZcbDxxns4n5vyGfLnglvxoFc6mKPAgMBAAGjLjAsMBwGA1UdEQQVMBOB
EWVyaWtAc2xhZ3Rlci5uYW1lMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEFBQADgYEASH1G
4NdOdGqXSxInybvla63EKOkqSqejb153dqd1uXXC6P8HbsX23vEqHiT1eP9JfYStNwuNjB+E
osGFOkHGUtepGe48biXSR3ToWBZjoBtsjLYk4e7xWPE6ShBbE8y98pqt1VUBkmd64DADDBhg
BRWldcXBlSk4D/mJb4A1NukwggMDMIICbKADAgECAhBPmJmvBgo+M248AmAE0JXfMA0GCSqG
SIb3DQEBBQUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBD
QTAeFw0wNjA4MTYxMTQyMTNaFw0wNzA4MTYxMTQyMTNaMGoxEDAOBgNVBAQTB1NsYWd0ZXIx
FTATBgNVBCoTDEVyaWsgTWFydGlqbjEdMBsGA1UEAxMURXJpayBNYXJ0aWpuIFNsYWd0ZXIx
IDAeBgkqhkiG9w0BCQEWEWVyaWtAc2xhZ3Rlci5uYW1lMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEAsTI3+mwmYqzWIFCZN1tDnKbCQLq+QNYqVYj63WA/QkGtnk935T4Xe521
G4PwpNFX8/50iwm4t2kM8F1SgZ6sIcGBZpyB+mahGWqzgoakmtWmYLRJNFyMmLlR1o55hELW
Fu3x8e+/5wvUFTxO8lccPYcPRMTihwOJjSzROgNjQMjwI9qUJRlbL4zC6E91icPYfcRk/BAs
TopW8DB4Tt4gzXG2aYpu22+sFrQNRKth8VYteqnYlRNdfC8h6vTVqUqmFp8OvHAEdJtfktFO
2PTDz77m3F+btvklEOrtl9EMXz1+Q1Sq2MCfmtBgqmXGw8cZ7OJ+b8hny54Jb8aBXOpijwID
AQABoy4wLDAcBgNVHREEFTATgRFlcmlrQHNsYWd0ZXIubmFtZTAMBgNVHRMBAf8EAjAAMA0G
CSqGSIb3DQEBBQUAA4GBAEh9RuDXTnRql0sSJ8m75WutxCjpKkqno29ed3andbl1wuj/B27F
9t7xKh4k9Xj/SX2ErTcLjYwfhKLBhTpBxlLXqRnuPG4l0kd06FgWY6AbbIy2JOHu8VjxOkoQ
WxPMvfKardVVAZJneuAwAwwYYAUVpXXFwZUpOA/5iW+ANTbpMIIDPzCCAqigAwIBAgIBDTAN
BgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTES
MBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UE
CxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBl
cnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1Ro
YXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAK
MNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTX
p6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYB
Af8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBl
cnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYD
VQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2as
Zw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSe
JVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHT
HUb/XV9lTzGCA2QwggNgAgEBMHYwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBAhBPmJmvBgo+M248AmAE0JXfMAkGBSsOAwIaBQCgggHDMBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDkyNTEzMTQxNlowIwYJKoZI
hvcNAQkEMRYEFGomVvEx9xoeKY5s4U1KAo5FV0+GMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZI
hvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQT5iZrwYKPjNuPAJgBNCV3zCBhwYLKoZIhvcNAQkQAgsxeKB2
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQT5iZrwYK
PjNuPAJgBNCV3zANBgkqhkiG9w0BAQEFAASCAQBos43Dgk8M+WK0sPjO9qu+MTyGSjFCWuUv
VXPaxWdvkW6Xw9S6bqBCiUMi3O/zWT1ymF6qhNkPWtSbT01FZFVSqJOpuaOms0MLH9p/W/3I
0ed7Gto80tGRnChhmBcVvJjglmFZfMhBwpLx0h5KXs5mD+A3qQZLVsZuG2VWMhdn5aA06BHp
xI2Sk9kao2O6ol4GVRsc0NQgNA+lIo9vL/mM4dZ2wnQsHSkWYpoMQ5N0JFlZrXH9z68QPzpV
OMhw/z7fhUH0BSXhtS5OzO2397v2ZCGLAZN1taj7sZnkHvKXTW54mLPzg920tZX6vyNeJKJI
CfPhYsVnxtV7SpDLT2RaAAAAAAAA
--------------ms070201080303090309020206--


--===============1267219461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1267219461==--

