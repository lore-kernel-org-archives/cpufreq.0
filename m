From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Patch: Fix pending timer stuck condition
Date: Fri, 21 Oct 2005 14:42:22 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84303218897@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C5D677.8E5151C4"
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5D677.8E5151C4
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

> On Fri, Oct 21, 2005 at 01:02:48PM -0500, Langsdorf, Mark=20
> wrote:  > AMD recently discovered that on some hardware,  >=20
> there is a race condition possible when a C-state  > change=20
> request goes onto the bus at the same time  > as a P-state=20
> change request.  Both requests happen,  > but the southbridge=20
> hardware only acknowledges the  > C-state change.  The=20
> PowerNow! driver is then=20
>  > stuck in a loop, waiting for the P-state change
>  > acknowledgement.  The driver eventually times out,
>  > but can no longer perform P-state changes.
>  >=20
>  > It turns out the solution is to resend the P-state
>  > change, which the southbridge will acknowledge
>  > normally.
>  >=20
>  > Thanks to Johannes Winkelmann for reporting this
>  > and testing the fix.
>=20
> Excellent detective work!

Thanks.

> I'll get this sent along to Linus for inclusion in 2.6.14
> as there have been a number of reports of this.

I know, I know...
=20
> One question though, this part..
>=20
> -               if (i++ > 0x1000000) {
> +               if (i++ > 10000) {
>                         printk(KERN_ERR PFX "detected change=20
> pending stuck\n");
>                         return 1;
>=20
>=20
> means that on affected hardware, we'll see that msg a lot=20
> more regularly now. Was this intentional, or a leftover=20
> debugging change ?

Originally, that code read an MSR 16 million times and
then timed out.  Even with a fast processor, that takes
some time.  Under testing, Johannes noted that he lost
his keyboard for 2-3 seconds during a retried frequency
transition.  Bringing down the timeout made it much
more responsive.

You've got a point, though - that message should really
be a dprintk now, not a KERN_ERR.  It's harmless with
the retry unless the retry fails after 100 tries.

> Final nit, please add a Signed-off-by: Mark Langsdorf=20
> <mark.langsdorf@amd.com> line for future patches.  (I still=20
> apply them if they lack that line, but following the=20
> established protocol is a nice bonus touch ;-)

Doh!  Will do.

Resubmitting the patch with the dprintk

Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

-Mark Langsdorf
AMD, Inc.

------_=_NextPart_001_01C5D677.8E5151C4
Content-Type: application/octet-stream;
 name=pn-collision-retry.patch
Content-Transfer-Encoding: base64
Content-Description: pn-collision-retry.patch
Content-Disposition: attachment;
 filename=pn-collision-retry.patch

LS0tIGxpbnV4LTIuNi4xMy40L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93ZXJub3ct
azguYwkyMDA1LTEwLTIxIDE0OjM5OjUwLjAwMDAwMDAwMCAtMDUwMAorKysgbGludXgtcmV2YW1w
L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93ZXJub3ctazgtMi5jCTIwMDUtMTAtMjEg
MTQ6MzA6MjUuMDAwMDAwMDAwIC0wNTAwCkBAIC00NCw3ICs0NCw3IEBACiAKICNkZWZpbmUgUEZY
ICJwb3dlcm5vdy1rODogIgogI2RlZmluZSBCRlggUEZYICJCSU9TIGVycm9yOiAiCi0jZGVmaW5l
IFZFUlNJT04gInZlcnNpb24gMS41MC4zIgorI2RlZmluZSBWRVJTSU9OICJ2ZXJzaW9uIDEuNTAu
NCIKICNpbmNsdWRlICJwb3dlcm5vdy1rOC5oIgogCiAvKiBzZXJpYWxpemUgZnJlcSBjaGFuZ2Vz
ICAqLwpAQCAtMTExLDggKzExMSw4IEBACiAJdTMyIGkgPSAwOwogCiAJZG8gewotCQlpZiAoaSsr
ID4gMHgxMDAwMDAwKSB7Ci0JCQlwcmludGsoS0VSTl9FUlIgUEZYICJkZXRlY3RlZCBjaGFuZ2Ug
cGVuZGluZyBzdHVja1xuIik7CisJCWlmIChpKysgPiAxMDAwMCkgeworCQkJZHByaW50aygiZGV0
ZWN0ZWQgY2hhbmdlIHBlbmRpbmcgc3R1Y2tcbiIpOwogCQkJcmV0dXJuIDE7CiAJCX0KIAkJcmRt
c3IoTVNSX0ZJRFZJRF9TVEFUVVMsIGxvLCBoaSk7CkBAIC0xNTksNiArMTU5LDcgQEAKIHsKIAl1
MzIgbG87CiAJdTMyIHNhdmV2aWQgPSBkYXRhLT5jdXJydmlkOworCXUzMiBpID0gMDsKIAogCWlm
ICgoZmlkICYgSU5WQUxJRF9GSURfTUFTSykgfHwgKGRhdGEtPmN1cnJ2aWQgJiBJTlZBTElEX1ZJ
RF9NQVNLKSkgewogCQlwcmludGsoS0VSTl9FUlIgUEZYICJpbnRlcm5hbCBlcnJvciAtIG92ZXJm
bG93IG9uIGZpZCB3cml0ZVxuIik7CkBAIC0xNzAsMTAgKzE3MSwxMyBAQAogCWRwcmludGsoIndy
aXRpbmcgZmlkIDB4JXgsIGxvIDB4JXgsIGhpIDB4JXhcbiIsCiAJCWZpZCwgbG8sIGRhdGEtPnBs
bGxvY2sgKiBQTExfTE9DS19DT05WRVJTSU9OKTsKIAotCXdybXNyKE1TUl9GSURWSURfQ1RMLCBs
bywgZGF0YS0+cGxsbG9jayAqIFBMTF9MT0NLX0NPTlZFUlNJT04pOwotCi0JaWYgKHF1ZXJ5X2N1
cnJlbnRfdmFsdWVzX3dpdGhfcGVuZGluZ193YWl0KGRhdGEpKQotCQlyZXR1cm4gMTsKKwlkbyB7
CisJCXdybXNyKE1TUl9GSURWSURfQ1RMLCBsbywgZGF0YS0+cGxsbG9jayAqIFBMTF9MT0NLX0NP
TlZFUlNJT04pOworCQlpZiAoaSsrID4gMTAwKSB7CisJCQlwcmludGsoS0VSTl9FUlIgUEZYICJp
bnRlcm5hbCBlcnJvciAtIHBlbmRpbmcgYml0IHZlcnkgc3R1Y2sgLSBubyBmdXJ0aGVyIHBzdGF0
ZSBjaGFuZ2VzIHBvc3NpYmxlXG4iKTsKKwkJCXJldHJ1biAxOworCQl9CQkJCisJfSB3aGlsZSAo
cXVlcnlfY3VycmVudF92YWx1ZXNfd2l0aF9wZW5kaW5nX3dhaXQoZGF0YSkpOwogCiAJY291bnRf
b2ZmX2lydChkYXRhKTsKIApAQCAtMTk3LDYgKzIwMSw3IEBACiB7CiAJdTMyIGxvOwogCXUzMiBz
YXZlZmlkID0gZGF0YS0+Y3VycmZpZDsKKwlpbnQgaSA9IDA7CiAKIAlpZiAoKGRhdGEtPmN1cnJm
aWQgJiBJTlZBTElEX0ZJRF9NQVNLKSB8fCAodmlkICYgSU5WQUxJRF9WSURfTUFTSykpIHsKIAkJ
cHJpbnRrKEtFUk5fRVJSIFBGWCAiaW50ZXJuYWwgZXJyb3IgLSBvdmVyZmxvdyBvbiB2aWQgd3Jp
dGVcbiIpOwpAQCAtMjA4LDEwICsyMTMsMTMgQEAKIAlkcHJpbnRrKCJ3cml0aW5nIHZpZCAweCV4
LCBsbyAweCV4LCBoaSAweCV4XG4iLAogCQl2aWQsIGxvLCBTVE9QX0dSQU5UXzVOUyk7CiAKLQl3
cm1zcihNU1JfRklEVklEX0NUTCwgbG8sIFNUT1BfR1JBTlRfNU5TKTsKLQotCWlmIChxdWVyeV9j
dXJyZW50X3ZhbHVlc193aXRoX3BlbmRpbmdfd2FpdChkYXRhKSkKLQkJcmV0dXJuIDE7CisJZG8g
eworCQl3cm1zcihNU1JfRklEVklEX0NUTCwgbG8sIFNUT1BfR1JBTlRfNU5TKTsKKyAgICAgICAg
ICAgICAgICBpZiAoaSsrID4gMTAwKSB7CisgICAgICAgICAgICAgICAgICAgICAgICBwcmludGso
S0VSTl9FUlIgUEZYICJpbnRlcm5hbCBlcnJvciAtIHBlbmRpbmcgYml0IHZlcnkgc3R1Y2sgLSBu
byBmdXJ0aGVyIHBzdGF0ZSBjaGFuZ2VzIHBvc3NpYmxlXG4iKTsKKyAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAxOworICAgICAgICAgICAgICAgIH0KKwl9IHdoaWxlIChxdWVyeV9jdXJy
ZW50X3ZhbHVlc193aXRoX3BlbmRpbmdfd2FpdChkYXRhKSk7CiAKIAlpZiAoc2F2ZWZpZCAhPSBk
YXRhLT5jdXJyZmlkKSB7CiAJCXByaW50ayhLRVJOX0VSUiBQRlggImZpZCBjaGFuZ2VkIG9uIHZp
ZCB0cmFucywgb2xkIDB4JXggbmV3IDB4JXhcbiIsCg==

------_=_NextPart_001_01C5D677.8E5151C4
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C5D677.8E5151C4--


