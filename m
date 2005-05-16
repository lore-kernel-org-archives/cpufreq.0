From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH 1/2] export cpu_core_map
Date: Mon, 16 May 2005 12:26:19 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC019@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C55A3C.5F4ABE72"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: ak@suse.de, cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C55A3C.5F4ABE72
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Export the cpu_core_map structure for use in other
parts of the kernel.  Needed for the dual-core
PowerNow! driver.

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

-Mark Langsdorf
AMD, Inc.

------_=_NextPart_001_01C55A3C.5F4ABE72
Content-Type: application/octet-stream;
 name=export_cpu_core_map.patch
Content-Transfer-Encoding: base64
Content-Description: export_cpu_core_map.patch
Content-Disposition: attachment;
 filename=export_cpu_core_map.patch

LS0tIGxpbnV4LTIuNi4xMi10ZXN0L2FyY2gveDg2XzY0L2tlcm5lbC9zbXBib290LmMJMjAwNS0w
NS0xMSAxMjoyODo0Mi4wMDAwMDAwMDAgLTA1MDAKKysrIGxpbnV4LTIuNi4xMi1yYzQtcG4vYXJj
aC94ODZfNjQva2VybmVsL3NtcGJvb3QuYwkyMDA1LTA1LTEwIDE3OjA2OjExLjAwMDAwMDAwMCAt
MDUwMApAQCAtOTMsNiArOTMsNyBAQAogCiBjcHVtYXNrX3QgY3B1X3NpYmxpbmdfbWFwW05SX0NQ
VVNdIF9fY2FjaGVsaW5lX2FsaWduZWQ7CiBjcHVtYXNrX3QgY3B1X2NvcmVfbWFwW05SX0NQVVNd
IF9fY2FjaGVsaW5lX2FsaWduZWQ7CitFWFBPUlRfU1lNQk9MKGNwdV9jb3JlX21hcCk7CiAKIC8q
CiAgKiBUcmFtcG9saW5lIDgweDg2IHByb2dyYW0gYXMgYW4gYXJyYXkuCg==

------_=_NextPart_001_01C55A3C.5F4ABE72
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C55A3C.5F4ABE72--


