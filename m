From: Erik Slagter <erik@slagter.name>
Subject: Pentium D 915 support
Date: Sun, 30 Jul 2006 15:12:16 +0200
Message-ID: <1154265136.21063.10.camel@skylla.slagter.name>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1762744491=="
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
To: cpufreq@lists.linux.org.uk


--===============1762744491==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-4z6OgwEq4TTs5RO1wDGy"


--=-4z6OgwEq4TTs5RO1wDGy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

I just bought a new motherboard and cpu and carefully checked whether
both support EIST.

The motherboard is a ASUStek P5WDG2-WS, the cpu a Pentium D 915. This
seems to be the only (besides the 945) from the 9xx series that has
proper EIST support (new stepping), according to the intel
processorfinder.

I already learned that I need to use speedstep-centrino (odd...) but the
module doesn't load (not found message).

I guess this cpu is too new to have cpufreq support (I am running with
kernel 2.6.18-rc2, btw), so I had a peek in the source file, and found a
table with apparently cpuid values. The values of my D915 were not there
(as expected). So I added it and changed two other places, and it looks
(very superfluously) that this should be enough to make it work, at
least to make the module recognise the cpu.

I don't dare to test it though, I don't know if I can break stuff this
way (like really, permanently...).

Can you please have a look and give your comments?

cat /proc/cpuinfo:

> cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 15
> model           : 6
> model name      :               Intel(R) Pentium(R) D CPU 2.80GHz
> stepping        : 4
> cpu MHz         : 2800.000
> cache size      : 2048 KB
> physical id     : 0
> siblings        : 2
> core id         : 0
> cpu cores       : 2
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 6
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm =
constant_tsc pni monitor ds_cpl est cid cx16 xtpr lahf_lm
> bogomips        : 5623.94
> clflush size    : 64
> cache_alignment : 128
> address sizes   : 36 bits physical, 48 bits virtual
> power management:
>=20
> processor       : 1
> vendor_id       : GenuineIntel
> cpu family      : 15
> model           : 6
> model name      :               Intel(R) Pentium(R) D CPU 2.80GHz
> stepping        : 4
> cpu MHz         : 2800.000
> cache size      : 2048 KB
> physical id     : 0
> siblings        : 2
> core id         : 1
> cpu cores       : 2
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 6
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mc=
a cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm syscall nx lm =
constant_tsc pni monitor ds_cpl est cid cx16 xtpr lahf_lm
> bogomips        : 5620.20
> clflush size    : 64
> cache_alignment : 128
> address sizes   : 36 bits physical, 48 bits virtual
> power management:

This is what I did to speedstep-centrino.c:

--- speedstep-centrino.c        2006-07-30 15:02:25.000000000 +0200
+++ speedstep-centrino.c-ems    2006-07-30 15:01:04.000000000 +0200
@@ -50,6 +50,7 @@
        CPU_DOTHAN_B0,
        CPU_MP4HT_D0,
        CPU_MP4HT_E0,
+       CPU_PD900,
 };

 static const struct cpu_id cpu_ids[] =3D {
@@ -59,6 +60,7 @@
        [CPU_DOTHAN_B0] =3D { 6, 13, 6 },
        [CPU_MP4HT_D0]  =3D {15,  3, 4 },
        [CPU_MP4HT_E0]  =3D {15,  4, 1 },
+       [CPU_PD900]             =3D {15,  6, 4 },
 };
 #define N_IDS  ARRAY_SIZE(cpu_ids)

@@ -226,6 +228,7 @@
        { &cpu_ids[CPU_DOTHAN_B0], NULL, 0, NULL },
        { &cpu_ids[CPU_MP4HT_D0], NULL, 0, NULL },
        { &cpu_ids[CPU_MP4HT_E0], NULL, 0, NULL },
+       { &cpu_ids[CPU_PD900], NULL, 0, NULL },

        { NULL, }
 };

Thank you for your time.

--=-4z6OgwEq4TTs5RO1wDGy
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
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDczMDEzMTIxNlow
IwYJKoZIhvcNAQkEMRYEFB8rNNvE5dJBuyRMGEAHowTTkwyOMHgGCSsGAQQBgjcQBDFrMGkwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNV
BAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMP8QQwegYLKoZIhvcNAQkQ
Agsxa6BpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBM
dGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDD/EEMA0G
CSqGSIb3DQEBAQUABIGAkDiZQqb23x5e6p+Ut/RFKEZHk0p0t8gMDIYxZF/qmHaQt4FyEMFW58BI
JUdOn+5wmSTXHX4pLifYeBSYaEsD84jmGna3tSQfVPIUr5j7DGn7tPhXgOtw9PtiS8yS+0q6Zoc5
KxenCb2gTYVwtyAQ/5aIDxYEEpVHtMeLrt9C+YoAAAAAAAA=


--=-4z6OgwEq4TTs5RO1wDGy--



--===============1762744491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1762744491==--


