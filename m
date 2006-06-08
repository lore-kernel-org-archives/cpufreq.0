From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH][2/2] correct fid/vid masks for extended parts
Date: Thu, 8 Jun 2006 10:33:19 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A8430564A373@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C68B10.DF1A2BED"
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
To: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C68B10.DF1A2BED
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The fid/vid masks for parts using the extended=20
parts are slightly incorrect and can result in
incorrect fid/vid codes being applied.  No
instances of this problem have been reported in
the field but it could be a problem with future
parts.

-Mark Langsdorf
AMD, Inc.

(posted and attached because my mailer is braindead)
signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

--- linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.c.orig
2006-06-08 09:44:17.000000000 -0500
+++ linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
2006-06-08 10:23:37.000000000 -0500
@@ -885,8 +885,8 @@ static int fill_powernow_table_fidvid(st
 		u32 vid;
=20
 		if (data->exttype) {
-			fid =3D data->acpi_data.states[i].status &
FID_MASK;
-			vid =3D (data->acpi_data.states[i].status >>
VID_SHIFT) & VID_MASK;
+			fid =3D data->acpi_data.states[i].status &
EXT_FID_MASK;
+			vid =3D (data->acpi_data.states[i].status >>
VID_SHIFT) & EXT_VID_MASK;
 		} else {
 			fid =3D data->acpi_data.states[i].control &
FID_MASK;
 			vid =3D (data->acpi_data.states[i].control >>
VID_SHIFT) & VID_MASK;
--- linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.h.orig
2006-06-08 09:44:25.000000000 -0500
+++ linux-mm6-2.6.17/arch/i386/kernel/cpu/cpufreq/powernow-k8.h
2006-06-08 10:23:45.000000000 -0500
@@ -169,7 +169,9 @@ struct powernow_k8_data {
 #define MVS_MASK        3
 #define VST_MASK     0x7f
 #define VID_MASK     0x1f
-#define FID_MASK     0x3f
+#define FID_MASK     0x1f
+#define EXT_VID_MASK 0x3f
+#define EXT_FID_MASK 0x3f
=20
=20
 /*

------_=_NextPart_001_01C68B10.DF1A2BED
Content-Type: application/octet-stream;
 name=ext_mask.patch
Content-Transfer-Encoding: base64
Content-Description: ext_mask.patch
Content-Disposition: attachment;
 filename=ext_mask.patch

c2lnbmVkLW9mZi1ieTogTWFyayBMYW5nc2RvcmYgPG1hcmsubGFuZ3Nkb3JmQGFtZC5jb20+Cgot
LS0gbGludXgtbW02LTIuNi4xNy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3Bvd2Vybm93
LWs4LmMub3JpZwkyMDA2LTA2LTA4IDA5OjQ0OjE3LjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgt
bW02LTIuNi4xNy9hcmNoL2kzODYva2VybmVsL2NwdS9jcHVmcmVxL3Bvd2Vybm93LWs4LmMJMjAw
Ni0wNi0wOCAxMDoyMzozNy4wMDAwMDAwMDAgLTA1MDAKQEAgLTg4NSw4ICs4ODUsOCBAQCBzdGF0
aWMgaW50IGZpbGxfcG93ZXJub3dfdGFibGVfZmlkdmlkKHN0CiAJCXUzMiB2aWQ7CiAKIAkJaWYg
KGRhdGEtPmV4dHR5cGUpIHsKLQkJCWZpZCA9IGRhdGEtPmFjcGlfZGF0YS5zdGF0ZXNbaV0uc3Rh
dHVzICYgRklEX01BU0s7Ci0JCQl2aWQgPSAoZGF0YS0+YWNwaV9kYXRhLnN0YXRlc1tpXS5zdGF0
dXMgPj4gVklEX1NISUZUKSAmIFZJRF9NQVNLOworCQkJZmlkID0gZGF0YS0+YWNwaV9kYXRhLnN0
YXRlc1tpXS5zdGF0dXMgJiBFWFRfRklEX01BU0s7CisJCQl2aWQgPSAoZGF0YS0+YWNwaV9kYXRh
LnN0YXRlc1tpXS5zdGF0dXMgPj4gVklEX1NISUZUKSAmIEVYVF9WSURfTUFTSzsKIAkJfSBlbHNl
IHsKIAkJCWZpZCA9IGRhdGEtPmFjcGlfZGF0YS5zdGF0ZXNbaV0uY29udHJvbCAmIEZJRF9NQVNL
OwogCQkJdmlkID0gKGRhdGEtPmFjcGlfZGF0YS5zdGF0ZXNbaV0uY29udHJvbCA+PiBWSURfU0hJ
RlQpICYgVklEX01BU0s7Ci0tLSBsaW51eC1tbTYtMi42LjE3L2FyY2gvaTM4Ni9rZXJuZWwvY3B1
L2NwdWZyZXEvcG93ZXJub3ctazguaC5vcmlnCTIwMDYtMDYtMDggMDk6NDQ6MjUuMDAwMDAwMDAw
IC0wNTAwCisrKyBsaW51eC1tbTYtMi42LjE3L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEv
cG93ZXJub3ctazguaAkyMDA2LTA2LTA4IDEwOjIzOjQ1LjAwMDAwMDAwMCAtMDUwMApAQCAtMTY5
LDcgKzE2OSw5IEBAIHN0cnVjdCBwb3dlcm5vd19rOF9kYXRhIHsKICNkZWZpbmUgTVZTX01BU0sg
ICAgICAgIDMKICNkZWZpbmUgVlNUX01BU0sgICAgIDB4N2YKICNkZWZpbmUgVklEX01BU0sgICAg
IDB4MWYKLSNkZWZpbmUgRklEX01BU0sgICAgIDB4M2YKKyNkZWZpbmUgRklEX01BU0sgICAgIDB4
MWYKKyNkZWZpbmUgRVhUX1ZJRF9NQVNLIDB4M2YKKyNkZWZpbmUgRVhUX0ZJRF9NQVNLIDB4M2YK
IAogCiAvKgo=

------_=_NextPart_001_01C68B10.DF1A2BED
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C68B10.DF1A2BED--


