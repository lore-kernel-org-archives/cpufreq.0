From: "wang daolong" <ahlongxp@gmail.com>
Subject: help on speedstep__Intel PM 753
Date: Sun, 1 Apr 2007 23:21:37 +0800
Message-ID: <dc84318c0704010821t24b26c7bj5bd0fe7000a7a13@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_61206_2550513.1175440897731"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type;
	b=HmOGC549Whi70/4OjE1ERf7cEX9KAbnkuPnLuPrSIm84pAsSAnKg+AWZrPfTkV25Jnt+S7+1u2e+43HjU69hAhR5t80SnVXs6r9aNP3Lbn5yr+V3EMqwFXLt2+R+x1SW8qEoTGAjJOFTFvarbOksC5TE+WZyTHLbBu9RGdUhGRg=
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

------=_Part_61206_2550513.1175440897731
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,everyone,

I'm using a Ultra Low Voltage Intel Pentium M processor 1200MHz (PM
753). But the speedstep-centrino module doesn't support it(get a
ENODEV).
In kernel 2.6.15(ubuntu dapper), I wrote a patch to make it's speedstep work.
but when I applied the patch to latest kernel 2.6.20.4, it won't work any more.
I tried for hours,but failed entirely.
help!!

/proc/cpuinfo

processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 13
model name      : Intel(R) Pentium(R) M processor 1.20GHz
stepping        : 8
cpu MHz         : 600.057
cache size      : 2048 KB
fdiv_bug        : no
hlt_bug         : no
f00f_bug        : no
coma_bug        : no
fpu             : yes
fpu_exception   : yes
cpuid level     : 2
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge
mca cmov pat clflush dts acpi mmx fxsr sse sse2 ss tm pbe nx est tm2
bogomips        : 1201.05
clflush size    : 64

patch for kernel 2.6.15

59a60
> 	CPU_DOTHAN_753,
68a70
> 	[CPU_DOTHAN_753]	= {6,  13, 8 },
104a107,117
> /* Ultra Low Voltage Intel Pentium M processor 1200MHz (Dothan753) */
> static struct cpufreq_frequency_table dothan_1200[] =
> {
> 	OP(600,  812),
> 	OP(800,  860),
> 	OP(900,  876),
> 	OP(1000,  908),
> 	OP(1100,  924),
> 	OP(1200,  940),
> 	{ .frequency = CPUFREQ_TABLE_END }
> };
316a330
> 	DOTHAN(&cpu_ids[CPU_DOTHAN_753], 1200, "1.20"),
324d337
<
391c404,405
< 	if ((centrino_cpu[cpu] == &cpu_ids[CPU_BANIAS]) ||
---
> 	if ((centrino_cpu[cpu] == &cpu_ids[CPU_DOTHAN_753]) ||
> 		(centrino_cpu[cpu] == &cpu_ids[CPU_BANIAS]) ||


Regards,
ahlongxp,
Northeastern University, China

------=_Part_61206_2550513.1175440897731
Content-Type: application/octet-stream; name=cpuinfo
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ezzmy3rc
Content-Disposition: attachment; filename="cpuinfo"

cHJvY2Vzc29yCTogMAp2ZW5kb3JfaWQJOiBHZW51aW5lSW50ZWwKY3B1IGZhbWlseQk6IDYKbW9k
ZWwJCTogMTMKbW9kZWwgbmFtZQk6IEludGVsKFIpIFBlbnRpdW0oUikgTSBwcm9jZXNzb3IgMS4y
MEdIegpzdGVwcGluZwk6IDgKY3B1IE1IegkJOiA2MDAuMDU3CmNhY2hlIHNpemUJOiAyMDQ4IEtC
CmZkaXZfYnVnCTogbm8KaGx0X2J1ZwkJOiBubwpmMDBmX2J1Zwk6IG5vCmNvbWFfYnVnCTogbm8K
ZnB1CQk6IHllcwpmcHVfZXhjZXB0aW9uCTogeWVzCmNwdWlkIGxldmVsCTogMgp3cAkJOiB5ZXMK
ZmxhZ3MJCTogZnB1IHZtZSBkZSBwc2UgdHNjIG1zciBwYWUgbWNlIGN4OCBhcGljIHNlcCBtdHJy
IHBnZSBtY2EgY21vdiBwYXQgY2xmbHVzaCBkdHMgYWNwaSBtbXggZnhzciBzc2Ugc3NlMiBzcyB0
bSBwYmUgbnggZXN0IHRtMgpib2dvbWlwcwk6IDEyMDEuMDUKY2xmbHVzaCBzaXplCTogNjQKCg==

------=_Part_61206_2550513.1175440897731
Content-Type: application/octet-stream; 
	name=for_2.6.15_speedstep-centrino.c.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ezzn0n1h
Content-Disposition: attachment;
	filename="for_2.6.15_speedstep-centrino.c.patch"

NTlhNjAKPiAJQ1BVX0RPVEhBTl83NTMsCjY4YTcwCj4gCVtDUFVfRE9USEFOXzc1M10JPSB7Niwg
IDEzLCA4IH0sCjEwNGExMDcsMTE3Cj4gLyogVWx0cmEgTG93IFZvbHRhZ2UgSW50ZWwgUGVudGl1
bSBNIHByb2Nlc3NvciAxMjAwTUh6IChEb3RoYW43NTMpICovCj4gc3RhdGljIHN0cnVjdCBjcHVm
cmVxX2ZyZXF1ZW5jeV90YWJsZSBkb3RoYW5fMTIwMFtdID0KPiB7Cj4gCU9QKDYwMCwgIDgxMiks
Cj4gCU9QKDgwMCwgIDg2MCksCj4gCU9QKDkwMCwgIDg3NiksCj4gCU9QKDEwMDAsICA5MDgpLAo+
IAlPUCgxMTAwLCAgOTI0KSwKPiAJT1AoMTIwMCwgIDk0MCksCj4gCXsgLmZyZXF1ZW5jeSA9IENQ
VUZSRVFfVEFCTEVfRU5EIH0KPiB9OwozMTZhMzMwCj4gCURPVEhBTigmY3B1X2lkc1tDUFVfRE9U
SEFOXzc1M10sIDEyMDAsICIxLjIwIiksCjMyNGQzMzcKPCAKMzkxYzQwNCw0MDUKPCAJaWYgKChj
ZW50cmlub19jcHVbY3B1XSA9PSAmY3B1X2lkc1tDUFVfQkFOSUFTXSkgfHwKLS0tCj4gCWlmICgo
Y2VudHJpbm9fY3B1W2NwdV0gPT0gJmNwdV9pZHNbQ1BVX0RPVEhBTl83NTNdKSB8fAo+IAkJKGNl
bnRyaW5vX2NwdVtjcHVdID09ICZjcHVfaWRzW0NQVV9CQU5JQVNdKSB8fAoK
------=_Part_61206_2550513.1175440897731
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_61206_2550513.1175440897731--

