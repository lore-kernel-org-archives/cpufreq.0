From: Erik Slagter <erik@slagter.name>
Subject: TM1/TM2
Date: Mon, 02 Oct 2006 13:30:20 +0200
Message-ID: <4520F84C.6090604@slagter.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0534558031=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq <cpufreq@www.linux.org.uk>

This is a cryptographically signed message in MIME format.

--===============0534558031==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090903080004090407080101"

This is a cryptographically signed message in MIME format.

--------------ms090903080004090407080101
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Is there a reliable way to know whether tm1/tm2 and/or other throttling
have been applied by the hardware?

I am very suspicious that my cpu does tm1 or tm2 once in a while, but I
can't prove it. It doesn't seem to be reported via MCE, which I'd expect.

FWIW I have a Pentium D915 and it has eist and tm1/tm2 (although linux
says only tm1), all enabled in the BIOS.

--------------ms090903080004090407080101
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MTAwMjExMzAyMFowIwYJKoZI
hvcNAQkEMRYEFHyz8jtfrAmFuuRw7ciwmuTgl8KuMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZI
hvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQT5iZrwYKPjNuPAJgBNCV3zCBhwYLKoZIhvcNAQkQAgsxeKB2
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQT5iZrwYK
PjNuPAJgBNCV3zANBgkqhkiG9w0BAQEFAASCAQCTS1YZ60XH9J72LO44cFB4oCUsGXhPNi6/
IM2O0Q8D6s2mbzeymI4qUH1WpO6U47CfFit6ei3siVQD5qxmzeWtjXYaERoY+QLhilnsxd35
nP6Ww49pmCpUNKXl3K3OVvyy4AJhjA7x1HcnzPLeSHxy5OaSB8loGmuo9QEQijKc3jwi6vSd
viRT2bOv/1D6+wxDDAgzqBBaZMaKbUP+51HarkK3DoProA5xRqR8UavbKhvJgeX475WWGD5G
i00bdQSp1DdyeQss5ejx66Rgngei7CdZPgRcVIXl2G746Wzqbt5QU9lsQAazSZ5tnKPvHIdE
fFcXr2+SgZoPQ6bwMb4zAAAAAAAA
--------------ms090903080004090407080101--


--===============0534558031==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0534558031==--

