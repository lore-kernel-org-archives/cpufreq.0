From: Erik Slagter <erik@slagter.name>
Subject: Re: Pentium D 915 support
Date: Sun, 30 Jul 2006 17:58:49 +0200
Message-ID: <1154275129.21063.31.camel@skylla.slagter.name>
References: <1154265136.21063.10.camel@skylla.slagter.name>
	<44CCD154.3080606@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0709413785=="
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44CCD154.3080606@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk


--===============0709413785==
Content-Type: multipart/signed; micalg=sha1;
	protocol="application/x-pkcs7-signature";
	boundary="=-hR8RJzlGpiAAWqoFmpMy"


--=-hR8RJzlGpiAAWqoFmpMy
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On zo, 2006-07-30 at 19:33 +0400, Alexey Starikovskiy wrote:

Erik Slagter wrote:

> > The motherboard is a ASUStek P5WDG2-WS, the cpu a Pentium D 915. This
> > seems to be the only (besides the 945) from the 9xx series that has
> > proper EIST support (new stepping), according to the intel
> > processorfinder.
> >=20
> > I already learned that I need to use speedstep-centrino (odd...) but th=
e
> > module doesn't load (not found message).
> >=20
> > I guess this cpu is too new to have cpufreq support (I am running with
> > kernel 2.6.18-rc2, btw), so I had a peek in the source file, and found =
a
> > table with apparently cpuid values. The values of my D915 were not ther=
e
> > (as expected). So I added it and changed two other places, and it looks
> > (very superfluously) that this should be enough to make it work, at
> > least to make the module recognise the cpu.
> >=20
> > I don't dare to test it though, I don't know if I can break stuff this
> > way (like really, permanently...).

> Do you have acpi support disabled in your kernel? Cpufreq driver
> should get information from it for new processors.

I have acpi enabled. More precisely:=20

> CONFIG_ACPI=3Dy
> # CONFIG_ACPI_AC is not set
> # CONFIG_ACPI_BATTERY is not set
> # CONFIG_ACPI_BUTTON is not set
> # CONFIG_ACPI_VIDEO is not set
> # CONFIG_ACPI_HOTKEY is not set
> # CONFIG_ACPI_FAN is not set
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_THERMAL=3Dy
> # CONFIG_ACPI_ASUS is not set
> # CONFIG_ACPI_IBM is not set
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ACPI_BLACKLIST_YEAR=3D0
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_EC=3Dy
> CONFIG_ACPI_POWER=3Dy
> CONFIG_ACPI_SYSTEM=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_SBS is not set

Cpufreq:

> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_TABLE=3Dy
> CONFIG_CPU_FREQ_DEBUG=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_STAT_DETAILS is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy

> CONFIG_X86_POWERNOW_K8=3Dm
> CONFIG_X86_POWERNOW_K8_ACPI=3Dy
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO_ACPI=3Dy
> CONFIG_X86_ACPI_CPUFREQ=3Dm

I tried all driver modules in turn. The acpi-cpufreq modules loads but
gives weird output (see later on). Powernow-k8 doesn't load which was to
be expected. But speedstep-centrino doesn't load either:

artemis root:... $ modprobe speedstep-centrino
FATAL: Error inserting speedstep_centrino (...speedstep-centrino.ko): No su=
ch device

dmesg doesn't say anything.

modprobe acpi-cpufreq does work but output of cpufreq-info shows:

> cpufrequtils 0.4: cpufreq-info (C) Dominik Brodowski 2004
> Report errors and bugs to linux@brodo.de, please.
> analyzing CPU 0:
>   driver: acpi-cpufreq
>   CPUs which need to switch frequency at the same time: 0
>   hardware limits: 2.40 GHz - 2.80 GHz
>   available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80=
 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz  available cpufreq g=
overnors: conservative, ondemand, powersave, userspace, performance
>   current policy: frequency should be within 2.40 GHz and 2.80 GHz.
>                   The governor "performance" may decide which speed to us=
e
>                   within this range.
>   current CPU frequency is 2.80 GHz.
> analyzing CPU 1:
>   driver: acpi-cpufreq
>   CPUs which need to switch frequency at the same time: 1
>   hardware limits: 2.40 GHz - 2.80 GHz
>   available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80=
 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz  available cpufreq g=
overnors: conservative, ondemand, powersave, userspace, performance
>   current policy: frequency should be within 2.40 GHz and 2.80 GHz.
>                   The governor "performance" may decide which speed to us=
e
>                   within this range.
>   current CPU frequency is 2.80 GHz.

Please note the amount of repeated same frequency.

Also, it strikes me that /proc/acpi/../power only shows C1, is this normal?

Last but not least: the loading or unloading of the module doesn't have
any effect on the actual power consumption, even with powersave governor
and both cores at 2.4 Ghz (both at 140 W).

--=-hR8RJzlGpiAAWqoFmpMy
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
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDczMDE1NTg0OVow
IwYJKoZIhvcNAQkEMRYEFDzFNRzDDupdto3UAdvKgLI1b0izMHgGCSsGAQQBgjcQBDFrMGkwYjEL
MAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNV
BAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMP8QQwegYLKoZIhvcNAQkQ
Agsxa6BpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBM
dGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDD/EEMA0G
CSqGSIb3DQEBAQUABIGASUph+bW28pPqIhCZ+ZgOkgBqt5sBq2s74r2mNZXFcEYbdrnXGsNwk1G+
lWEqn2RE04HF9hrYMczjzy68V7Uj5ij7peNCJrIYV+YvbrkTJUUGTJwoKhomJRjpWbSvFEWjoK4o
b6Eb10GLO44aq3BgJBSlLMdT2eCNDGmyyhqU4ZIAAAAAAAA=


--=-hR8RJzlGpiAAWqoFmpMy--



--===============0709413785==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============0709413785==--


