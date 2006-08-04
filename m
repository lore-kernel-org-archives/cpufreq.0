From: Erik Slagter <erik@slagter.name>
Subject: RE: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Fri, 04 Aug 2006 22:43:36 +0200
Message-ID: <1154724216.8243.14.camel@skylla.slagter.name>
References: <EB12A50964762B4D8111D55B764A84545A5DD7@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0372046381=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84545A5DD7@scsmsx413.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk


--===============0372046381==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-WQYc/asqKCMfkzCpgjXf"


--=-WQYc/asqKCMfkzCpgjXf
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On vr, 2006-08-04 at 13:16 -0700, Pallipadi, Venkatesh wrote:
> >Huh, I don't have this entry! Only min and max.

> This entry depends on what scaling_driver you are using. If you are
> using speedstep_centrino, you should have this..

I am not using speedstep_centrino, it doesn't load. I've been told
that's because apparently the bios on my motherboard prevents cpufreq
from accessing the relevant msr's. So I run acpi-cpufreq, which indeed
seems to work. But no current speed entry.

--=-WQYc/asqKCMfkzCpgjXf
Content-Type: application/x-pkcs7-signature; name=smime.p7s
Content-Disposition: attachment; filename=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIILzCCAnIw
ggHboAMCAQICAw/xBDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDUxMTI5MTc0MTQ0WhcNMDYxMTI5MTc0MTQ0WjBqMRAwDgYDVQQE
EwdTbGFndGVyMRUwEwYDVQQqEwxFcmlrIE1hcnRpam4xHTAbBgNVBAMTFEVyaWsgTWFydGlqbiBT
bGFndGVyMSAwHgYJKoZIhvcNAQkBFhFlcmlrQHNsYWd0ZXIubmFtZTCBnzANBgkqhkiG9w0BAQEF
AAOBjQAwgYkCgYEAtYqGuTSGbsTHZPiKQnNmvpVaxVuBZS6rV5xuKD47J9hz8Vq3Xh4PpuGYNW5L
vevp80oj6sYAhNuU380UNRqALFaer8MtG6fXpvBgq+MCxVQzMyYxAnopqWlZQIUQNQX9wZmI0gVv
gY6vwcXRBXkMyrzm41dy4oFwh+PTj3U+xwcCAwEAAaMuMCwwHAYDVR0RBBUwE4ERZXJpa0BzbGFn
dGVyLm5hbWUwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQCf5+l4khcSjUOL8WcuJ7Q1
eXhSPe0VJEsHSfVJCNFmfFZFiGZNwQRliOuGFxSy+uPb8ZVIZ3cBIen/K0k2hWS6pCiDm3xNdkFU
mhWsibmyMoc91I0Re2ZWPmL6isxiyr56Qv7vNz2UHSinLJr/QtsvRv/RKFlcO1gm1wsCOPkyITCC
AnIwggHboAMCAQICAw/xBDANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZy
ZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDUxMTI5MTc0MTQ0WhcNMDYxMTI5MTc0MTQ0WjBqMRAwDgYD
VQQEEwdTbGFndGVyMRUwEwYDVQQqEwxFcmlrIE1hcnRpam4xHTAbBgNVBAMTFEVyaWsgTWFydGlq
biBTbGFndGVyMSAwHgYJKoZIhvcNAQkBFhFlcmlrQHNsYWd0ZXIubmFtZTCBnzANBgkqhkiG9w0B
AQEFAAOBjQAwgYkCgYEAtYqGuTSGbsTHZPiKQnNmvpVaxVuBZS6rV5xuKD47J9hz8Vq3Xh4PpuGY
NW5Lvevp80oj6sYAhNuU380UNRqALFaer8MtG6fXpvBgq+MCxVQzMyYxAnopqWlZQIUQNQX9wZmI
0gVvgY6vwcXRBXkMyrzm41dy4oFwh+PTj3U+xwcCAwEAAaMuMCwwHAYDVR0RBBUwE4ERZXJpa0Bz
bGFndGVyLm5hbWUwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQCf5+l4khcSjUOL8Wcu
J7Q1eXhSPe0VJEsHSfVJCNFmfFZFiGZNwQRliOuGFxSy+uPb8ZVIZ3cBIen/K0k2hWS6pCiDm3xN
dkFUmhWsibmyMoc91I0Re2ZWPmL6isxiyr56Qv7vNz2UHSinLJr/QtsvRv/RKFlcO1gm1wsCOPky
ITCCAz8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQI
EwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1
bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMT
G1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJl
ZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5NTlaMGIxCzAJBgNV
BAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNU
aGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAw
gYkCgYEAxKY8VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNa
LIkVcI7dyfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l0cUq
VIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCBkTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWls
Q0EuY3JsMAsGA1UdDwQEAwIBBjApBgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVs
Mi0xMzgwDQYJKoZIhvcNAQEFBQADgYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYf
qi2fNi/A9BxQIJNwPP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa
9/eH1sYITq726jTlEBpbNU1341YheILcIRk13iSx0x1G/11fZU8xggJmMIICYgIBATBpMGIxCzAJ
BgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQD
EyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDD/EEMAkGBSsOAwIaBQCgggFT
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDgwNDIwNDMzNlow
IwYJKoZIhvcNAQkEMRYEFNwU89kAaAqoJP9N5FGaCRJJIiiyMHgGCSsGAQQBgjcQBDFrMGkwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNV
BAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMP8QQwegYLKoZIhvcNAQkQ
Agsxa6BpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBM
dGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDD/EEMA0G
CSqGSIb3DQEBAQUABIGALpeaJOkN/x33KJvLk/OpJLxS0umDIFoP25yircZ6bS+/9IHsgtUWPD9m
eOFzoMN3S1Z65W9SHGP5W9fWUn3PSQP5tT5Mhu2osw2AKNjXfPCxY+iakC+DxIXv/24GDW8H9XOe
tSz/JBWW5sA0flxgb6+UJDHp7JzjBbbqHB+wrKkAAAAAAAA=


--=-WQYc/asqKCMfkzCpgjXf--



--===============0372046381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0372046381==--


