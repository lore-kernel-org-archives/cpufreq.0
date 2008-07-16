From: Laurence Darby <ldarby@tuffmail.com>
Subject: Core 2 Duo E8400 stepping 6 not recognised
Date: Thu, 17 Jul 2008 00:11:45 +0100
Message-ID: <20080717001145.122c97b7.ldarby@tuffmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="Multipart=_Thu__17_Jul_2008_00_11_45_+0100_/lxVwTHjT9xh572+"
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

This is a multi-part message in MIME format.

--Multipart=_Thu__17_Jul_2008_00_11_45_+0100_/lxVwTHjT9xh572+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit


Hi,

I booted linux 2.6.26 with cpufreq.debug=3, and it gives the following:

[    0.391292] cpufreq-core: CPU 0: _PPC is 0 - frequency not limited
[    0.391623] ACPI: ACPI0007:00 is registered as cooling_device0
[    0.391623] ACPI: Processor [CPU0] (supports 8 throttling states)
[    0.391623] cpufreq-core: CPU 1: _PPC is 0 - frequency not limited
[    0.391292] ACPI: ACPI0007:01 is registered as cooling_device1
[    0.391292] ACPI: Processor [CPU1] (supports 8 throttling states)

[    8.228001] acpi-cpufreq: acpi_cpufreq_init
[    8.228001] acpi-cpufreq: acpi_cpufreq_early_init
[    8.228001] cpufreq-core: trying to register driver acpi-cpufreq
[    8.228001] cpufreq-core: adding CPU 0
[    8.228001] acpi-cpufreq: acpi_cpufreq_cpu_init
[    8.228001] cpufreq-core: initialization failed
[    8.228001] cpufreq-core: adding CPU 1
[    8.228001] acpi-cpufreq: acpi_cpufreq_cpu_init
[    8.228001] cpufreq-core: initialization failed
[    8.228001] cpufreq-core: no CPU initialized for driver acpi-cpufreq
[    8.228001] cpufreq-core: unregistering CPU 0
[    8.228001] cpufreq-core: unregistering CPU 1

also cpuinfo attached.

The motherboard is gigabyte GA-G33-DS3R, chipset is Intel G33 ICH9 

What can I do to get this working?

Thanks,
Laurence


--Multipart=_Thu__17_Jul_2008_00_11_45_+0100_/lxVwTHjT9xh572+
Content-Type: text/plain;
 name="cpuinfo"
Content-Disposition: attachment;
 filename="cpuinfo"
Content-Transfer-Encoding: base64

cHJvY2Vzc29yCTogMA0KdmVuZG9yX2lkCTogR2VudWluZUludGVsDQpjcHUgZmFtaWx5CTogNg0K
bW9kZWwJCTogMjMNCm1vZGVsIG5hbWUJOiBJbnRlbChSKSBDb3JlKFRNKTIgRHVvIENQVSAgICAg
RTg0MDAgIEAgMy4wMEdIeg0Kc3RlcHBpbmcJOiA2DQpjcHUgTUh6CQk6IDMwMDAuMDQzDQpjYWNo
ZSBzaXplCTogNjE0NCBLQg0KcGh5c2ljYWwgaWQJOiAwDQpzaWJsaW5ncwk6IDINCmNvcmUgaWQJ
CTogMA0KY3B1IGNvcmVzCTogMg0KYXBpY2lkCQk6IDANCmluaXRpYWwgYXBpY2lkCTogMA0KZmRp
dl9idWcJOiBubw0KaGx0X2J1ZwkJOiBubw0KZjAwZl9idWcJOiBubw0KY29tYV9idWcJOiBubw0K
ZnB1CQk6IHllcw0KZnB1X2V4Y2VwdGlvbgk6IHllcw0KY3B1aWQgbGV2ZWwJOiAxMA0Kd3AJCTog
eWVzDQpmbGFncwkJOiBmcHUgdm1lIGRlIHBzZSB0c2MgbXNyIHBhZSBtY2UgY3g4IGFwaWMgc2Vw
IG10cnIgcGdlIG1jYSBjbW92IHBhdCBwc2UzNiBjbGZsdXNoIGR0cyBhY3BpIG1teCBmeHNyIHNz
ZSBzc2UyIHNzIGh0IHRtIHBiZSBueCBsbSBjb25zdGFudF90c2MgYXJjaF9wZXJmbW9uIHBlYnMg
YnRzIHBuaSBtb25pdG9yIGRzX2NwbCB2bXggc214IGVzdCB0bTIgc3NzZTMgY3gxNiB4dHByIHNz
ZTRfMSBsYWhmX2xtDQpib2dvbWlwcwk6IDYwMDkuMjcNCmNsZmx1c2ggc2l6ZQk6IDY0DQpwb3dl
ciBtYW5hZ2VtZW50Og0KDQpwcm9jZXNzb3IJOiAxDQp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwN
CmNwdSBmYW1pbHkJOiA2DQptb2RlbAkJOiAyMw0KbW9kZWwgbmFtZQk6IEludGVsKFIpIENvcmUo
VE0pMiBEdW8gQ1BVICAgICBFODQwMCAgQCAzLjAwR0h6DQpzdGVwcGluZwk6IDYNCmNwdSBNSHoJ
CTogMzAwMC4wNDMNCmNhY2hlIHNpemUJOiA2MTQ0IEtCDQpwaHlzaWNhbCBpZAk6IDANCnNpYmxp
bmdzCTogMg0KY29yZSBpZAkJOiAxDQpjcHUgY29yZXMJOiAyDQphcGljaWQJCTogMQ0KaW5pdGlh
bCBhcGljaWQJOiAxDQpmZGl2X2J1Zwk6IG5vDQpobHRfYnVnCQk6IG5vDQpmMDBmX2J1Zwk6IG5v
DQpjb21hX2J1Zwk6IG5vDQpmcHUJCTogeWVzDQpmcHVfZXhjZXB0aW9uCTogeWVzDQpjcHVpZCBs
ZXZlbAk6IDEwDQp3cAkJOiB5ZXMNCmZsYWdzCQk6IGZwdSB2bWUgZGUgcHNlIHRzYyBtc3IgcGFl
IG1jZSBjeDggYXBpYyBzZXAgbXRyciBwZ2UgbWNhIGNtb3YgcGF0IHBzZTM2IGNsZmx1c2ggZHRz
IGFjcGkgbW14IGZ4c3Igc3NlIHNzZTIgc3MgaHQgdG0gcGJlIG54IGxtIGNvbnN0YW50X3RzYyBh
cmNoX3BlcmZtb24gcGVicyBidHMgcG5pIG1vbml0b3IgZHNfY3BsIHZteCBzbXggZXN0IHRtMiBz
c3NlMyBjeDE2IHh0cHIgc3NlNF8xIGxhaGZfbG0NCmJvZ29taXBzCTogNTk5OS45MA0KY2xmbHVz
aCBzaXplCTogNjQNCnBvd2VyIG1hbmFnZW1lbnQ6DQoNCg==

--Multipart=_Thu__17_Jul_2008_00_11_45_+0100_/lxVwTHjT9xh572+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Multipart=_Thu__17_Jul_2008_00_11_45_+0100_/lxVwTHjT9xh572+--

