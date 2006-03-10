From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: p4_clockmod broken in 2.6.16-rc? kernels
Date: Thu, 9 Mar 2006 20:07:44 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB60077E8338@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C643F8.2F683590"
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
To: Mike Galbraith <efault@gmx.de>
Cc: cpufreq@lists.linux.org.uk, davej@codemonkey.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C643F8.2F683590
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Great to hear that the patch helped. I had a typo in the patch header
and attaching an updated patch.=20

Dave: Please push this patch towards base. This was a bug in one of the
recent changes in p4-clockmod.c

Thanks,
Venki=20

>-----Original Message-----
>From: Mike Galbraith [mailto:efault@gmx.de]=20
>Sent: Thursday, March 09, 2006 7:26 PM
>To: Pallipadi, Venkatesh
>Cc: cpufreq@lists.linux.org.uk; davej@codemonkey.org.uk
>Subject: RE: p4_clockmod broken in 2.6.16-rc? kernels
>
>On Thu, 2006-03-09 at 05:53 -0800, Pallipadi, Venkatesh wrote:
>> Please try the attached patch and let me know whether that helps.
>
>Sorry for the late response.  I'm the father of an 18 year old chip off
>the old block-head... 'nuff said.
>
>Yes, this fixes it for both SMP and UP.  Thanks for the quick response.
>
>	-Mike
>
>(Now to go patch my kernel. 2250 Mhz my south 40.. buy cpu for $$ get
>bonus defects for free.. mutter mutter gripe bitch whine complain;)=20
>

------_=_NextPart_001_01C643F8.2F683590
Content-Type: application/octet-stream;
	name="p4clockmod.patch"
Content-Transfer-Encoding: base64
Content-Description: p4clockmod.patch
Content-Disposition: attachment;
	filename="p4clockmod.patch"

CkZpeCB0aGUgY29kZSB0byBkaXNhYmxlIGZyZXFzIGxlc3MgdGhhbiAyR0h6IGluIE42MCBlcnJh
dGEuCgpTaWduZWQtb2ZmLWJ5OiBWZW5rYXRlc2ggUGFsbGlwYWRpIDx2ZW5rYXRlc2gucGFsbGlw
YWRpQGludGVsLmNvbT4KCkluZGV4OiBsaW51eC0yLjYuMTUvYXJjaC9pMzg2L2tlcm5lbC9jcHUv
Y3B1ZnJlcS9wNC1jbG9ja21vZC5jCj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGxpbnV4LTIuNi4xNS5vcmlnL2Fy
Y2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcDQtY2xvY2ttb2QuYworKysgbGludXgtMi42LjE1
L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcDQtY2xvY2ttb2QuYwpAQCAtMjQ0LDcgKzI0
NCw3IEBAIHN0YXRpYyBpbnQgY3B1ZnJlcV9wNF9jcHVfaW5pdChzdHJ1Y3QgY3AKIAlmb3IgKGk9
MTsgKHA0Y2xvY2ttb2RfdGFibGVbaV0uZnJlcXVlbmN5ICE9IENQVUZSRVFfVEFCTEVfRU5EKTsg
aSsrKSB7CiAJCWlmICgoaTwyKSAmJiAoaGFzX040NF9PMTdfZXJyYXRhW3BvbGljeS0+Y3B1XSkp
CiAJCQlwNGNsb2NrbW9kX3RhYmxlW2ldLmZyZXF1ZW5jeSA9IENQVUZSRVFfRU5UUllfSU5WQUxJ
RDsKLQkJZWxzZSBpZiAoaGFzX042MF9lcnJhdGFbcG9saWN5LT5jcHVdICYmIHA0Y2xvY2ttb2Rf
dGFibGVbaV0uZnJlcXVlbmN5IDwgMjAwMDAwMCkKKwkJZWxzZSBpZiAoaGFzX042MF9lcnJhdGFb
cG9saWN5LT5jcHVdICYmICgoc3RvY2tfZnJlcSAqIGkpLzgpIDwgMjAwMDAwMCkKIAkJCXA0Y2xv
Y2ttb2RfdGFibGVbaV0uZnJlcXVlbmN5ID0gQ1BVRlJFUV9FTlRSWV9JTlZBTElEOwogCQllbHNl
CiAJCQlwNGNsb2NrbW9kX3RhYmxlW2ldLmZyZXF1ZW5jeSA9IChzdG9ja19mcmVxICogaSkvODsK

------_=_NextPart_001_01C643F8.2F683590
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C643F8.2F683590--

