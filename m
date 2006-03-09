From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: p4_clockmod broken in 2.6.16-rc? kernels
Date: Thu, 9 Mar 2006 05:53:14 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60077AFDA6@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C64380.CFF15078"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: Mike Galbraith <efault@gmx.de>, cpufreq@lists.linux.org.uk
Cc: davej@codemonkey.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C64380.CFF15078
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Please try the attached patch and let me know whether that helps.

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of Mike Galbraith
>Sent: Wednesday, March 08, 2006 10:12 PM
>To: cpufreq@lists.linux.org.uk
>Cc: davej@codemonkey.org.uk
>Subject: p4_clockmod broken in 2.6.16-rc? kernels
>
>Greetings,
>
>As subject says, it appears to be broken for at least one single P4 HT
>system, namely mine.  2.6.15 works fine.
>
>With a UP compiled kernel, it fails completely, due to CPU0 failure to
>initialize.  With an SMP compiled kernel, CPU0 fails, but the sibling
>initializes.  Nothing good happens afterward though.  See debug
>(cpufreq.debug=3D7) output below.
>
>	Cheers,
>
>	-Mike
>
>cpufreq-core: trying to register driver p4-clockmod
>cpufreq-core: adding CPU 0
>p4-clockmod: has errata -- disabling frequencies lower than 2ghz
>speedstep-lib: x86: f, model: 2
>speedstep-lib: ebx value is 9, x86_mask is 9
>speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xf12000f 0x0
>speedstep-lib: P4 - FSB 200000 kHz; Multiplier 15; Speed 3000000 kHz
>freq-table: setting show_table for cpu 0 to c14bd800
>freq-table: table entry 0 is invalid, skipping
>freq-table: table entry 1 is invalid, skipping
>freq-table: table entry 2 is invalid, skipping
>freq-table: table entry 3 is invalid, skipping
>freq-table: table entry 4 is invalid, skipping
>freq-table: table entry 5 is invalid, skipping
>freq-table: table entry 6 is invalid, skipping
>freq-table: table entry 7 is invalid, skipping
>freq-table: table entry 8 is invalid, skipping
>cpufreq-core: initialization failed
>cpufreq-core: adding CPU 1
>p4-clockmod: has errata -- disabling frequencies lower than 2ghz
>speedstep-lib: x86: f, model: 2
>speedstep-lib: ebx value is 9, x86_mask is 9
>speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xf12000f 0x0
>speedstep-lib: P4 - FSB 200000 kHz; Multiplier 15; Speed 3000000 kHz
>freq-table: setting show_table for cpu 1 to c14bd800
>freq-table: table entry 0 is invalid, skipping
>freq-table: table entry 1: 375000 kHz, 1 index
>freq-table: table entry 2: 750000 kHz, 2 index
>freq-table: table entry 3: 1125000 kHz, 3 index
>freq-table: table entry 4: 1500000 kHz, 4 index
>freq-table: table entry 5: 1875000 kHz, 5 index
>freq-table: table entry 6: 2250000 kHz, 6 index
>freq-table: table entry 7: 2625000 kHz, 7 index
>freq-table: table entry 8: 3000000 kHz, 8 index
>cpufreq-core: setting new policy for CPU 1: 375000 - 3000000 kHz
>freq-table: request for verification of policy (375000 -=20
>3000000 kHz) for cpu 1
>freq-table: verification lead to (375000 - 3000000 kHz) for cpu 1
>freq-table: request for verification of policy (375000 -=20
>3000000 kHz) for cpu 1
>freq-table: verification lead to (375000 - 3000000 kHz) for cpu 1
>cpufreq-core: new min and max freqs are 375000 - 3000000 kHz
>cpufreq-core: governor switch
>cpufreq-core: __cpufreq_governor for CPU 1, event 1
>performance: setting to 3000000 kHz because of event 1
>cpufreq-core: target for CPU 1: 3000000 kHz, relation 1
>freq-table: request for target 3000000 kHz (relation: 1) for cpu 1
>freq-table: target is 8 (3000000 kHz, 8)
>cpufreq-core: governor: change or update limits
>cpufreq-core: __cpufreq_governor for CPU 1, event 3
>performance: setting to 3000000 kHz because of event 3
>cpufreq-core: target for CPU 1: 3000000 kHz, relation 1
>freq-table: request for target 3000000 kHz (relation: 1) for cpu 1
>freq-table: target is 8 (3000000 kHz, 8)
>cpufreq-core: initialization complete
>cpufreq-core: driver p4-clockmod up and running
>p4-clockmod: P4/Xeon(TM) CPU On-Demand Clock Modulation available
>
>[lack of events]
>
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>

------_=_NextPart_001_01C64380.CFF15078
Content-Type: application/octet-stream;
	name="p4clockmod.patch"
Content-Transfer-Encoding: base64
Content-Description: p4clockmod.patch
Content-Disposition: attachment;
	filename="p4clockmod.patch"

CkZpeCB0aGUgY29kZSB0byBkaXNhYmxlIGZyZXFzIGxlc3MgdGhhbiAyR0h6IGluIE40NCAwMTcg
ZXJyYXRhLgoKU2lnbmVkLW9mZi1ieTogVmVua2F0ZXNoIFBhbGxpcGFkaSA8dmVua2F0ZXNoLnBh
bGxpcGFkaUBpbnRlbC5jb20+CgpJbmRleDogbGludXgtMi42LjE1L2FyY2gvaTM4Ni9rZXJuZWwv
Y3B1L2NwdWZyZXEvcDQtY2xvY2ttb2QuYwo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Ci0tLSBsaW51eC0yLjYuMTUub3Jp
Zy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3A0LWNsb2NrbW9kLmMKKysrIGxpbnV4LTIu
Ni4xNS9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3A0LWNsb2NrbW9kLmMKQEAgLTI0NCw3
ICsyNDQsNyBAQCBzdGF0aWMgaW50IGNwdWZyZXFfcDRfY3B1X2luaXQoc3RydWN0IGNwCiAJZm9y
IChpPTE7IChwNGNsb2NrbW9kX3RhYmxlW2ldLmZyZXF1ZW5jeSAhPSBDUFVGUkVRX1RBQkxFX0VO
RCk7IGkrKykgewogCQlpZiAoKGk8MikgJiYgKGhhc19ONDRfTzE3X2VycmF0YVtwb2xpY3ktPmNw
dV0pKQogCQkJcDRjbG9ja21vZF90YWJsZVtpXS5mcmVxdWVuY3kgPSBDUFVGUkVRX0VOVFJZX0lO
VkFMSUQ7Ci0JCWVsc2UgaWYgKGhhc19ONjBfZXJyYXRhW3BvbGljeS0+Y3B1XSAmJiBwNGNsb2Nr
bW9kX3RhYmxlW2ldLmZyZXF1ZW5jeSA8IDIwMDAwMDApCisJCWVsc2UgaWYgKGhhc19ONjBfZXJy
YXRhW3BvbGljeS0+Y3B1XSAmJiAoKHN0b2NrX2ZyZXEgKiBpKS84KSA8IDIwMDAwMDApCiAJCQlw
NGNsb2NrbW9kX3RhYmxlW2ldLmZyZXF1ZW5jeSA9IENQVUZSRVFfRU5UUllfSU5WQUxJRDsKIAkJ
ZWxzZQogCQkJcDRjbG9ja21vZF90YWJsZVtpXS5mcmVxdWVuY3kgPSAoc3RvY2tfZnJlcSAqIGkp
Lzg7Cg==

------_=_NextPart_001_01C64380.CFF15078
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C64380.CFF15078--

