From: Clemens Orthacker <clemens.orthacker@xicrypt.com>
Subject: speedstep for P4M on ALi  M1671
Date: Mon, 23 Aug 2004 12:21:07 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200408231221.07132.clemens.orthacker@xicrypt.com>
Reply-To: clemens.orthacker@xicrypt.com
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0789570969=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk

This is a multipart MIME message, it may require a MIME capable user agent.
--===============0789570969==
Content-Type: multipart/signed; micalg=sha1;
	boundary="--IAIK.SMIME.MAPPER.D20753FD--";
	protocol="application/x-pkcs7-signature"

This is a multipart MIME message, it may require a MIME capable user agent.
----IAIK.SMIME.MAPPER.D20753FD--
Content-Disposition: inline
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi!
I'm not sure whether speedstep works for my P4M laptop with ALi northbridge=
=20
(see lspci -v below) and linux 2.6.8.1.=20
I can modprobe speedstep-lib but neither speedstep-ich nor speedstep-smi=20
(which is normal since I don't have a ICH or 440 southbridge). Should I use=
=20
p4-clockmode? But this doesn't do voltage scaling...

However, I can set scaling_governor to userspace and use powernowd, which=
=20
according to /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq works.=
=20
(changes from 1200000 to 1900000 sometimes, though I couldn't figure out wh=
en=20
this is done... when running md5sum or compiling, it rests at 1200000 and=
=20
when I'm doing nothing, it switches to 1900000. I guess I will have to play=
=20
with powernowd's operation modes).

Does this mean that speedstep works for me (with voltage scaling?)?

$ dmesg | grep -i cpufreq
cpufreq: CPU0 - ACPI performance management activated.
cpufreq:  P0: 1900 MHz, 0 mW, 250 uS
cpufreq: *P1: 1200 MHz, 0 mW, 250 uS

$ lspci -v
0000:00:00.0 Host bridge: ALi Corporation M1671 Super P4 Northbridge=20
[AGP4X,PCI and SDR/DDR] (rev 02)
        Flags: bus master, medium devsel, latency 0
        Memory at f0000000 (32-bit, prefetchable)
        Capabilities: <available only to root>

0000:00:01.0 PCI bridge: ALi Corporation PCI to AGP Controller (prog-if 00=
=20
[Normal decode])
        Flags: bus master, slow devsel, latency 0
        Bus: primary=3D00, secondary=3D01, subordinate=3D01, sec-latency=3D0
        Memory behind bridge: e1000000-e1ffffff
        Prefetchable memory behind bridge: e8000000-efffffff

0000:00:06.0 Multimedia audio controller: ALi Corporation M5451 PCI AC-Link=
=20
Controller Audio Device (rev 02)
        Subsystem: Wistron Corp.: Unknown device 2002
        Flags: bus master, medium devsel, latency 64, IRQ 11
        I/O ports at 1800
        Memory at e0001000 (32-bit, non-prefetchable) [size=3D4K]
        Capabilities: <available only to root>

0000:00:07.0 ISA bridge: ALi Corporation M1533 PCI to ISA Bridge [Aladdin I=
V]
        Subsystem: Wistron Corp.: Unknown device 1061
        Flags: bus master, medium devsel, latency 0
        Capabilities: <available only to root>

0000:00:08.0 Modem: ALi Corporation M5457 AC'97 Modem Controller (prog-if 0=
0=20
[Generic])
        Subsystem: Wistron Corp.: Unknown device 1052
        Flags: bus master, medium devsel, latency 64, IRQ 11
        Memory at e0002000 (32-bit, non-prefetchable)
        I/O ports at 1c00 [size=3D256]
        Capabilities: <available only to root>

0000:00:0a.0 Ethernet controller: Realtek Semiconductor Co., Ltd.=20
RTL-8139/8139C/8139C+ (rev 10)
        Subsystem: Wistron Corp.: Unknown device 1053
        Flags: bus master, medium devsel, latency 64, IRQ 10
        I/O ports at 2000
        Memory at e0003000 (32-bit, non-prefetchable) [size=3D256]
        Capabilities: <available only to root>

0000:00:0b.0 FireWire (IEEE 1394): VIA Technologies, Inc. IEEE 1394 Host=20
Controller (rev 46) (prog-if 10 [OHCI])
        Subsystem: Wistron Corp.: Unknown device 1057
        Flags: bus master, medium devsel, latency 64, IRQ 11
        Memory at e0003800 (32-bit, non-prefetchable)
        I/O ports at 2400 [size=3D128]
        Capabilities: <available only to root>

0000:00:0c.0 Network controller: Intersil Corporation Prism 2.5 Wavelan=20
chipset (rev 01)
        Subsystem: Intersil Corporation Prism 2.5 Wavelan chipset
        Flags: medium devsel, IRQ 11
        Memory at e0006000 (32-bit, prefetchable)
        Capabilities: <available only to root>

0000:00:0d.0 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI=
])
        Subsystem: Wistron Corp.: Unknown device 1058
        Flags: bus master, medium devsel, latency 64, IRQ 10
        Memory at e0004000 (32-bit, non-prefetchable)
        Capabilities: <available only to root>

0000:00:0d.1 USB Controller: NEC Corporation USB (rev 41) (prog-if 10 [OHCI=
])
        Subsystem: Wistron Corp.: Unknown device 1058
        Flags: bus master, medium devsel, latency 64, IRQ 11
        Memory at e0005000 (32-bit, non-prefetchable)
        Capabilities: <available only to root>

0000:00:0d.2 USB Controller: NEC Corporation USB 2.0 (rev 02) (prog-if 20=
=20
[EHCI])
        Subsystem: Wistron Corp.: Unknown device 1058
        Flags: bus master, medium devsel, latency 132, IRQ 11
        Memory at e0003400 (32-bit, non-prefetchable)
        Capabilities: <available only to root>

0000:00:10.0 IDE interface: ALi Corporation M5229 IDE (rev c4) (prog-if 8a=
=20
[Master SecP PriP])
        Subsystem: Wistron Corp.: Unknown device 1061
        Flags: bus master, medium devsel, latency 32
        I/O ports at 2480 [size=3D16]
        Capabilities: <available only to root>

0000:00:11.0 Bridge: ALi Corporation M7101 PMU
        Subsystem: Wistron Corp.: Unknown device 1061
        Flags: medium devsel

0000:00:13.0 CardBus bridge: O2 Micro, Inc. OZ6912 Cardbus Controller
        Subsystem: Wistron Corp.: Unknown device 3102
        Flags: bus master, stepping, slow devsel, latency 168, IRQ 10
        Memory at 20000000 (32-bit, non-prefetchable)
        Bus: primary=3D00, secondary=3D02, subordinate=3D05, sec-latency=3D=
176
        Memory window 0: 20400000-207ff000 (prefetchable)
        Memory window 1: 20800000-20bff000
        I/O window 0: 00004000-000040ff
        I/O window 1: 00004400-000044ff
        16-bit legacy interface ports at 0001

0000:01:00.0 VGA compatible controller: nVidia Corporation NV11 [GeForce2 G=
o]=20
(rev b2) (prog-if 00 [VGA])
        Subsystem: Wistron Corp.: Unknown device 2052
        Flags: bus master, 66MHz, medium devsel, latency 248, IRQ 10
        Memory at e1000000 (32-bit, non-prefetchable)
        Memory at e8000000 (32-bit, prefetchable) [size=3D128M]
        Capabilities: <available only to root>

Kernel Config:

# CPU Frequency scaling
#
CONFIG_CPU_FREQ=3Dy
CONFIG_CPU_FREQ_PROC_INTF=3Dm
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
# CONFIG_CPU_FREQ_24_API is not set
CONFIG_CPU_FREQ_TABLE=3Dy

#
# CPUFreq processor drivers
#
CONFIG_X86_ACPI_CPUFREQ=3Dm
# CONFIG_X86_ACPI_CPUFREQ_PROC_INTF is not set
# CONFIG_X86_POWERNOW_K6 is not set
# CONFIG_X86_POWERNOW_K7 is not set
# CONFIG_X86_POWERNOW_K8 is not set
# CONFIG_X86_GX_SUSPMOD is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
CONFIG_X86_SPEEDSTEP_ICH=3Dm
CONFIG_X86_SPEEDSTEP_SMI=3Dm
CONFIG_X86_P4_CLOCKMOD=3Dm
CONFIG_X86_SPEEDSTEP_LIB=3Dm
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK=3Dy
# CONFIG_X86_LONGRUN is not set
# CONFIG_X86_LONGHAUL is not set


--=20
| Clemens Orthacker
| XiCrypt Technologies
| e-mail: clemens.orthacker@xicrypt.com
| phone: +43/650/6693393


----IAIK.SMIME.MAPPER.D20753FD--
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAA
oIIJgjCCAwowggJzoAMCAQICAwzELTANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoG
A1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQw
NzI4MTM0MjEzWhcNMDUwNzI4MTM0MjEzWjBPMR8wHQYDVQQDExZUaGF3dGUgRnJl
ZW1haWwgTWVtYmVyMSwwKgYJKoZIhvcNAQkBFh1jbGVtZW5zLm9ydGhhY2tlckB4
aWNyeXB0LmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANXl4TyP
3zMj9HZtUkl/XxG02sRBW2splQLM3LT4Ke5kOmrXt4dRwcAtzSYprAc51gDgDyq+
WcbFw4e2onzpMb956sLH9ABSvN/GiZ5xou9QkaJIpfbktFuvm0Le5ray4/3OOXCv
ZK9qwyvMFL4d1rsJe043z9Df4eo5VjBAwvsmvlcQqWM+YdJ7G/x0hCezlrkEYkLK
R1cqekxup1JXLIAZxCghUSYISGnu0frhwfoWmCy7FdWhKGpZvs9C01v3BVgX1T03
D+ZuBvE1alBaoPsl9b+4QlxrWSCzBTwCGCTo8+rIXrDv9izyTGVPYhmzoIu9Cs5d
Jale6gPAhPHQ1A8CAwEAAaNdMFswDgYDVR0PAQH/BAQDAgP4MBEGCWCGSAGG+EIB
AQQEAwIFoDAoBgNVHREEITAfgR1jbGVtZW5zLm9ydGhhY2tlckB4aWNyeXB0LmNv
bTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAJqNwfMH03seLE7Fvgyu
iR2UL1TqyoJiZ1bN+6KTtPWxNLIVO2ILr4jAwKfBkpyokZ1+LoNsdZZz7A3mBLQe
FB5UCFmogwNx+l6eAccvqmUKeZf/i/fXYZjYWA1+w3vb3VlS3jLCk63pI1FMQGf7
jjmCLVsIdItX5YQNCxxwArg4MIIDPzCCAqigAwIBAgIBDTANBgkqhkiG9w0BAQUF
ADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UE
BxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UE
CxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhh
d3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25h
bC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIz
NTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5n
IChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJ
c3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7TrnK
mVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XR
xSpUhQ9IBH+nttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYB
Af8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1Ro
YXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQDAgEGMCkGA1UdEQQi
MCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG9w0BAQUF
AAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAg
k3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr3
94fWxghOrvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzCCAy0wggKWoAMC
AQICAQAwDQYJKoZIhvcNAQEEBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxX
ZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3Rl
IENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2
aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkG
CSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw05NjAx
MDEwMDAwMDBaFw0yMDEyMzEyMzU5NTlaMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UE
CBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRo
YXd0ZSBDb25zdWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2Vz
IERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0Ex
KzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWlsQHRoYXd0ZS5jb20wgZ8w
DQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANRp19SwlGRbcelH2AxRtupykbCEXn0t
DY97Et+FJXUodDpCLGMnn5V7S+9+GYcdhuqj3bnOlmQawhRuRKx85o/oTQ9xH0A4
pgCjh3j2+ZSGXq3qwF5269kUo11uenwMpUtVfwYZKX+emibVars4JAhqmMex2qOY
kf152+VaxBy5AgMBAAGjEzARMA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQEE
BQADgYEAx+ySfk749ZalZ2IqpPBNEWDQb41gWGGsJrtSNVwIzzD7qEqWih9iQiOM
Fw/0umScF6xHKd+dmF7SbGBxXKKs3Hnj524ARx+1DSjoAp3kmv0T9KbZfLH43F8j
JgmRgHPQFBveQ6mDJfLmnC8Vyv6mq4oHdYsM3VGEa+T40c53ooExggJEMIICQAIB
ATBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNz
dWluZyBDQQIDDMQtMAkGBSsOAwIaBQCggbEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQwODIzMTAyNjU0WjAjBgkqhkiG9w0BCQQx
FgQU/LPVGlTT7vV3IWcZL4K0LpKTAXUwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG
9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwDQYIKoZIhvcNAwIC
ASgwBwYFKw4DAgcwDQYJKoZIhvcNAQEBBQAEggEAE2BqVS9ihcmRkQlFCovLDBWR
DiCYXnW13xZAALW7bgX+bGGgD4MwaF1eTWrVA72n150LrF1K9fvTXjWjZeHtDx0W
cXTLqYrPa2v3j7mrkfKy9CWUPrnXSPCa/KOYkJiqfg7mFF6DaQOmpqBOObra6Fp/
n3dUWaJAg+O9rHnf2RmNDXwZZ8EJtXNF2SiY61fD6ym4Qd51WHHP/pigU27Pgt+O
Nuwblops3CWQbXNHplW5Rz5tOpaIXdjo629yOw2SAFdtemW8zyBB5fus9OFoamx3
U1X9pX5K5Ca+Cwps7Vgn45DO65T59CxJlVMrRWIKGIxKmESzbnKzZYg9jLkEeAAA
AAAAAA==
----IAIK.SMIME.MAPPER.D20753FD----



--===============0789570969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============0789570969==--


