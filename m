From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH 1/1] dual-core Opteron/Athlon 64 X2 bugfix
Date: Tue, 14 Jun 2005 16:07:47 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC161@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C57125.1D7CED82"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C57125.1D7CED82
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

powernow-k8 requires that a data structure for=20
each core be created in the _cpu_init function=20
call.  The cpufreq infrastructure doesn't call=20
_cpu_init for the second core in each processor.
Some systems crashed when _get was called with=20
an odd-numbered core because it tried to=20
dereference a NULL pointer since the data
structure had not been created.

The attached patch solves the problem by=20
initializing data structures for all shared
cores in the _cpu_init function.  It should
apply to 2.6.12-rc6 and has been tested by
AMD and Sun.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

-Mark Langsdorf
AMD, Inc.

------_=_NextPart_001_01C57125.1D7CED82
Content-Type: application/octet-stream;
 name=jhpn-2.6.12-rc6.patch
Content-Transfer-Encoding: base64
Content-Description: jhpn-2.6.12-rc6.patch
Content-Disposition: attachment;
 filename=jhpn-2.6.12-rc6.patch

LS0tIGxpbnV4LTIuNi4xMi1yYzYvYXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1ZnJlcS9wb3dlcm5v
dy1rOC5jLm9sZAkyMDA1LTA2LTEyIDE3OjQxOjU1LjEyMzY1MTE4NCAtMDUwMAorKysgbGludXgt
Mi42LjEyLXJjNi9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3Bvd2Vybm93LWs4LmMJMjAw
NS0wNi0xMiAxNzo0NjozMi43ODA0NDA5MzYgLTA1MDAKQEAgLTQ0LDcgKzQ0LDcgQEAKIAogI2Rl
ZmluZSBQRlggInBvd2Vybm93LWs4OiAiCiAjZGVmaW5lIEJGWCBQRlggIkJJT1MgZXJyb3I6ICIK
LSNkZWZpbmUgVkVSU0lPTiAidmVyc2lvbiAxLjQwLjIiCisjZGVmaW5lIFZFUlNJT04gInZlcnNp
b24gMS40MC40IgogI2luY2x1ZGUgInBvd2Vybm93LWs4LmgiCiAKIC8qIHNlcmlhbGl6ZSBmcmVx
IGNoYW5nZXMgICovCkBAIC05NzgsNyArOTc4LDcgQEAKIHsKIAlzdHJ1Y3QgcG93ZXJub3dfazhf
ZGF0YSAqZGF0YTsKIAljcHVtYXNrX3Qgb2xkbWFzayA9IENQVV9NQVNLX0FMTDsKLQlpbnQgcmM7
CisJaW50IHJjLCBpOwogCiAJaWYgKCFjaGVja19zdXBwb3J0ZWRfY3B1KHBvbC0+Y3B1KSkKIAkJ
cmV0dXJuIC1FTk9ERVY7CkBAIC0xMDY0LDcgKzEwNjQsOSBAQAogCXByaW50aygiY3B1X2luaXQg
ZG9uZSwgY3VycmVudCBmaWQgMHgleCwgdmlkIDB4JXhcbiIsCiAJICAgICAgIGRhdGEtPmN1cnJm
aWQsIGRhdGEtPmN1cnJ2aWQpOwogCi0JcG93ZXJub3dfZGF0YVtwb2wtPmNwdV0gPSBkYXRhOwor
CWZvcl9lYWNoX2NwdV9tYXNrKGksIGNwdV9jb3JlX21hcFtwb2wtPmNwdV0pIHsKKwkJcG93ZXJu
b3dfZGF0YVtpXSA9IGRhdGE7CisJfQogCiAJcmV0dXJuIDA7CiAK

------_=_NextPart_001_01C57125.1D7CED82
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C57125.1D7CED82--


