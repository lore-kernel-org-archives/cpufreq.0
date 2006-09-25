From: Erik Slagter <erik@slagter.name>
Subject: Re: [PATCH] acpi-cpufreq: Use IA32_APERF and IA32_MPERF and get freq
 feedback from hardware
Date: Mon, 25 Sep 2006 21:07:15 +0200
Message-ID: <451828E3.6040607@slagter.name>
References: <EB12A50964762B4D8111D55B764A8454A41225@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0433766815=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A8454A41225@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

This is a cryptographically signed message in MIME format.

--===============0433766815==
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms010702040505090500020406"

This is a cryptographically signed message in MIME format.

--------------ms010702040505090500020406
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Pallipadi, Venkatesh wrote:

> You can look at /sys/..../cpufreq/cpuinfo_cur_freq to get the
> instantaneous frequency from hardware (But only works when MSR based
> transitions are used. There is no way to get current frequency when IO
> port based transitions are being used).
> /sys/..../cpufreq/scaling_cur_freq and /proc/cpuinfo shows the last
> value that cpufreq tried to set.

These only give the frequencies the CPU was "designed" for, not the
actual frequency. Only the information in /proc/cpuinfo is correct, at
least, until cpufreq comes in.

> I am not sure how ondemand can help with more performance with C1E. One
> possible explanation:
> With C1E, hardware goes to lower frequency on idle by itself. Only
> difference ondemand can be making is running at a lower frequency even
> when CPU is busy and average utilization is low. Due to this CPU can run
> cooler than without ondemand. And due to that TM2 may not kick in as
> frequently as it would without the ondemand. But, I am not sure how C1E
> makes the difference here. This behavior should be same with ot without
> C1E capable CPU. What is the workload you have. Partially idle? What is
> the CPU utilization over time?

I observe this while compiling the kernel. It shows a consistent
discrepancy of a few seconds on a total of ~2:45 compile time. I am not
complaining ;-)

Is there a way to know for shure if either tm1 or tm2 kicked in? I'd
really like to know, I want to have max performance. If tm? kicks in, I
won't get that of course. If I know if/when it happens, I can try a
lower frequency or better cooling.

--------------ms010702040505090500020406
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDkyNTE5MDcxNVowIwYJKoZI
hvcNAQkEMRYEFG0Hh9ZZVw51aZZybaAioaqJtY8KMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZI
hvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3
DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQT5iZrwYKPjNuPAJgBNCV3zCBhwYLKoZIhvcNAQkQAgsxeKB2
MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQT5iZrwYK
PjNuPAJgBNCV3zANBgkqhkiG9w0BAQEFAASCAQBgjCWodIm6V0zxj/LpR5grXhZdc7LstPn3
Hrq7gaEqf8pdjC7GS52TfTTQWz9QqtUScrDlUWghiPjfJi9aMcE5Ui1j7t/UoeXuHqmkyrFk
8exTnAQo+B+fpWAJ5pgN4Df1hKVygQz1Mjt08i25SMolYRDJt/t/7jvt1j7I5JY/mZCVmlSy
sduUoVm3HozcMQAMnZHwHoTDj9D879AgSEyRoqYHYWG+46/fh4zO0q+/oOZWkgjEjiyoriIl
S+eNPqiBD7WY6Ywd8LJfSt3buvnwhSgXw3lQtB5f0fDXf74ey2pc+T2UM4vCEXLylxOufanR
dU2lv9RqMwjk26APYG2vAAAAAAAA
--------------ms010702040505090500020406--


--===============0433766815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0433766815==--

