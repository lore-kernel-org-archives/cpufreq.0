From: Clemens Orthacker <clemenso@sbox.tugraz.at>
Subject: kernel: acpi-cpufreq: Transition failed
Date: Wed, 2 Feb 2005 11:58:26 +0100
Message-ID: <200502021158.26890.clemenso@sbox.tugraz.at>
Reply-To: clemenso@sbox.tugraz.at
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1170467478=="
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is a multipart MIME message, it may require a MIME capable user agent.
--===============1170467478==
Content-Type: multipart/signed; micalg=sha1;
	boundary="--IAIK.SMIME.MAPPER.828A6080--";
	protocol="application/x-pkcs7-signature"

This is a multipart MIME message, it may require a MIME capable user agent.
----IAIK.SMIME.MAPPER.828A6080--
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi!

Since I'm using the 2.6.10 kernel I constantly get the following error:
kernel: acpi-cpufreq: Transition failed

Pentium4 M
acpi-cpufreq driver (userspace governor, powernowd)

Is this a configuration problem? (i read about this problem in a previous=
=20
posting)

Thanks,
Clemens

(btw. bogomips fails, and I have no idea why..)

#
# Power management options (ACPI, APM)
#
CONFIG_PM=3Dy
# CONFIG_PM_DEBUG is not set
CONFIG_SOFTWARE_SUSPEND=3Dy
CONFIG_PM_STD_PARTITION=3D"/dev/hda5"

#
# ACPI (Advanced Configuration and Power Interface) Support
#
CONFIG_ACPI=3Dy
CONFIG_ACPI_BOOT=3Dy
CONFIG_ACPI_INTERPRETER=3Dy
CONFIG_ACPI_SLEEP=3Dy
CONFIG_ACPI_SLEEP_PROC_FS=3Dy
CONFIG_ACPI_AC=3Dm
CONFIG_ACPI_BATTERY=3Dm
CONFIG_ACPI_BUTTON=3Dm
CONFIG_ACPI_VIDEO=3Dm
CONFIG_ACPI_FAN=3Dm
CONFIG_ACPI_PROCESSOR=3Dm
CONFIG_ACPI_THERMAL=3Dm
CONFIG_ACPI_ASUS=3Dm
# CONFIG_ACPI_IBM is not set
CONFIG_ACPI_TOSHIBA=3Dm
CONFIG_ACPI_BLACKLIST_YEAR=3D0
# CONFIG_ACPI_DEBUG is not set
CONFIG_ACPI_BUS=3Dy
CONFIG_ACPI_EC=3Dy
CONFIG_ACPI_POWER=3Dy
CONFIG_ACPI_PCI=3Dy
CONFIG_ACPI_SYSTEM=3Dy
CONFIG_X86_PM_TIMER=3Dy

#
# APM (Advanced Power Management) BIOS Support
#
# CONFIG_APM is not set

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
# CONFIG_CPU_FREQ_DEBUG is not set
CONFIG_CPU_FREQ_PROC_INTF=3Dm
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
CONFIG_CPU_FREQ_TABLE=3Dy

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=3Dm
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_SPEEDSTEP_ICH=3Dm
# CONFIG_X86_SPEEDSTEP_SMI is not set
# CONFIG_X86_P4_CLOCKMOD is not set
# CONFIG_X86_CPUFREQ_NFORCE2 is not set
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set

#
# shared options
#
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
CONFIG_X86_SPEEDSTEP_LIB=3Dm
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=3Dy


cat /proc/cpuinfo
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 15
model           : 2
model name      : Mobile Intel(R) Pentium(R) 4 - M CPU 1.90GHz
stepping        : 7
cpu MHz         : 1196.242
cache size      : 512 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov =
pat=20
pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe cid xtpr
bogomips        : 2367.48

--=20
| Clemens Orthacker
| e-mail: ClemensO@sbox.TUGraz.at
| phone: +43/650/6693393

--=20
| Clemens Orthacker
| e-mail: ClemensO@sbox.TUGraz.at
| phone: +43/650/6693393

--=20
| Clemens Orthacker
| e-mail: ClemensO@sbox.TUGraz.at
| phone: +43/650/6693393


----IAIK.SMIME.MAPPER.828A6080--
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAA
oIIJUzCCAtswggJEoAMCAQICAw2YbzANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoG
A1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQx
MjEwMTMwOTMyWhcNMDUxMjEwMTMwOTMyWjBJMR8wHQYDVQQDExZUaGF3dGUgRnJl
ZW1haWwgTWVtYmVyMSYwJAYJKoZIhvcNAQkBFhdjbGVtZW5zb0BzYm94LnR1Z3Jh
ei5hdDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOYMnFx4y3V1Q+lj
t8zozx9B6cFTEKow3uxA+1DOXqaz8arqmG6Gt91JjSxNuMfiapyVmhr5ENrhU1kY
o/9mUS06LSc8KRG30Jff726sCqZ7CZeu0zgoQLpsIXqeMw075mkD3HThtp8u802G
JCHJms2h7G1Q5f4HHpyA0yCFnhvDS25m16E+mj3AQh19szhy7fPFA0pozyACUKSO
Gaypv3Zl2xsnCoF8JnpylWsWya+GYZZJV6FIXUBbk8WAaFR53tTZUqk35BQRlaCE
No/WDGJTxhXaa0KQyP6TP8VJ6735ujLzldhyHH7vT1evCYKgdaki+Q1bugK4L/rl
jUp3CMkCAwEAAaM0MDIwIgYDVR0RBBswGYEXY2xlbWVuc29Ac2JveC50dWdyYXou
YXQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQAbpc6zXbRXq65edvt+
KasdLPizUhC9DJq2ZItO/JoI9h0eM3g0uYbG2kjVtqsXl/dau8RdzCbu7bJr7f/j
g+7xVK/E8457sVUqdzbOeLIW2duXvqUXfwRLxoRahJFpE4E8TH+pG1X17tPU4Sxa
STSGkl/UvnS5IN1MpyzZd2v4OTCCAz8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEF
BQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNV
BAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNV
BAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1Ro
YXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29u
YWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYy
MzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGlu
ZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065
yplaHmjAdQRwnd/p/6Me7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7d
yfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l
0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCBkTASBgNVHRMBAf8ECDAG
AQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9U
aGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjApBgNVHREE
IjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEF
BQADgYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQ
IJNwPP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa
9/eH1sYITq726jTlEBpbNU1341YheILcIRk13iSx0x1G/11fZU8wggMtMIIClqAD
AgECAgEAMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMM
V2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0
ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERp
dmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzAp
BgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wHhcNOTYw
MTAxMDAwMDAwWhcNMjAxMjMxMjM1OTU5WjCB0TELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFU
aGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNl
cyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENB
MSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMIGf
MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDUadfUsJRkW3HpR9gMUbbqcpGwhF59
LQ2PexLfhSV1KHQ6QixjJ5+Ve0vvfhmHHYbqo925zpZkGsIUbkSsfOaP6E0PcR9A
OKYAo4d49vmUhl6t6sBeduvZFKNdbnp8DKVLVX8GGSl/npom1Wq7OCQIapjHsdqj
mJH9edvlWsQcuQIDAQABoxMwETAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB
BAUAA4GBAMfskn5O+PWWpWdiKqTwTRFg0G+NYFhhrCa7UjVcCM8w+6hKloofYkIj
jBcP9LpknBesRynfnZhe0mxgcVyirNx54+duAEcftQ0o6AKd5Jr9E/Sm2Xyx+Nxf
IyYJkYBz0BQb3kOpgyXy5pwvFcr+pquKB3WLDN1RhGvk+NHOd6KBMYICRDCCAkAC
AQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcg
KFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElz
c3VpbmcgQ0ECAw2YbzAJBgUrDgMCGgUAoIGxMBgGCSqGSIb3DQEJAzELBgkqhkiG
9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA1MDIwMjEwNTgyNlowIwYJKoZIhvcNAQkE
MRYEFGMfRU4XbTbaoCmQVirlDm4dqmHKMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZI
hvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMA0GCCqGSIb3DQMC
AgEoMAcGBSsOAwIHMA0GCSqGSIb3DQEBAQUABIIBAFcu3G+tkRVqApFHkJBtG0sX
4x02xKr4uuHBdlwbaHxvAW2nhIminXvJ/iLmoZb/iGPcTGq3JrIl79vywOXTbmb5
hEpCgULFzZ0Daer2mtFwd1k99Q8quKUrkHYcDEHUgN5mDVXE+gD3axESLvqKPQYW
RE/Elai2FP+TwmZwPa9aTq+qekDHYDQXYgDexxRcvrZrvdzGP7kXLW3xgKy1i0ia
wAMj8AzbGnXqcEAUx+uhp3m+6idv+JU0tgE0qesoblvzqlT/37mfRDGMLKS4dWFu
2tauCCNr+FtJRBftT9ga6OVPowJvS3jvzMYFKVL96vN2TsWezPMrE4Udwp+ugtcA
AAAAAAA=
----IAIK.SMIME.MAPPER.828A6080----



--===============1170467478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--===============1170467478==--


