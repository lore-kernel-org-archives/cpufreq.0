From: "Li, Shaohua" <shaohua.li@intel.com>
Subject: patch for P4 TSC problem
Date: Thu, 4 Dec 2003 16:47:30 +0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <571ACEFD467F7749BC50E0A98C17CDD8D5FE20@pdsmsx403.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C3BA43.40B53114"
Return-path: <cpufreq-bounces@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
To: cpufreq@www.linux.org.uk

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3BA43.40B53114
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

TSC frequency doesn't change under P4 and above when CPU frequency
changes, which caused some problems. Attached patch will handle this
problem. How about it?

=20

Thanks,

Shaohua

=20


------_=_NextPart_001_01C3BA43.40B53114
Content-Type: application/octet-stream;
	name="tsc.patch"
Content-Transfer-Encoding: base64
Content-Description: tsc.patch
Content-Disposition: attachment;
	filename="tsc.patch"

LS0tIGEvYXJjaC9pMzg2L3RpbWVycy90aW1lcl90c2MuYwkyMDAzLTExLTI1IDE3OjU0OjA2LjAw
MDAwMDAwMCArMDgwMAorKysgYi9hcmNoL2kzODYvdGltZXJzL3RpbWVyX3RzYy5jCTIwMDMtMTEt
MjcgMTM6MTU6MzIuMDAwMDAwMDAwICswODAwCkBAIC0zMyw2ICszMyw3IEBACiBleHRlcm4gdm9s
YXRpbGUgdW5zaWduZWQgbG9uZyBqaWZmaWVzOwogCiBzdGF0aWMgaW50IHVzZV90c2M7CitzdGF0
aWMgaW50IHZhcmlhYmxlX3RzY19mcmVxID0gMTsKIC8qIE51bWJlciBvZiB1c2VjcyB0aGF0IHRo
ZSBsYXN0IGludGVycnVwdCB3YXMgZGVsYXllZCAqLwogc3RhdGljIGludCBkZWxheV9hdF9sYXN0
X2ludGVycnVwdDsKIApAQCAtMzM2LDcgKzMzNyw4IEBACiAJCWNwdV9kYXRhW2ZyZXEtPmNwdV0u
bG9vcHNfcGVyX2ppZmZ5ID0gY3B1ZnJlcV9zY2FsZShsb29wc19wZXJfamlmZnlfcmVmLCByZWZf
ZnJlcSwgZnJlcS0+bmV3KTsKICNpZm5kZWYgQ09ORklHX1NNUAogCQlpZiAodXNlX3RzYykgewot
CQkJZmFzdF9nZXR0aW1lb2Zmc2V0X3F1b3RpZW50ID0gY3B1ZnJlcV9zY2FsZShmYXN0X2dldHRp
bWVvZmZzZXRfcmVmLCBmcmVxLT5uZXcsIHJlZl9mcmVxKTsKKwkJCWlmICh2YXJpYWJsZV90c2Nf
ZnJlcSkKKwkJCQlmYXN0X2dldHRpbWVvZmZzZXRfcXVvdGllbnQgPSBjcHVmcmVxX3NjYWxlKGZh
c3RfZ2V0dGltZW9mZnNldF9yZWYsIGZyZXEtPm5ldywgcmVmX2ZyZXEpOwogCQkJY3B1X2toeiA9
IGNwdWZyZXFfc2NhbGUoY3B1X2toel9yZWYsIHJlZl9mcmVxLCBmcmVxLT5uZXcpOwogCQkJc2V0
X2N5YzJuc19zY2FsZShjcHVfa2h6LzEwMDApOwogCQl9CkBAIC0zNTIsNiArMzU0LDEzIEBACiB9
OwogI2VuZGlmCiAKK3N0YXRpYyB2b2lkIF9faW5pdCBpbml0X3ZhcmlhYmxlX3RzYyh2b2lkKQor
eworCS8qIFA0IGFuZCBhYm92ZSBDUFUgVFNDIGZyZXEgZG9lc24ndCBjaGFuZ2Ugd2hlbiBDUFUg
ZnJlcXVlbmN5IGNoYW5nZXMqLworCWlmICgoYm9vdF9jcHVfZGF0YS54ODYgPj0gMTUpICYmIChi
b290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9JTlRFTCkpCisJCXZhcmlhYmxl
X3RzY19mcmVxID0gMDsKKwkvKiBBZGQgc3VwcG9ydCBmb3IgQ1BVIGZyb20gbm9uLWludGVsIHZl
bmRvciAqLworfQogCiBzdGF0aWMgaW50IF9faW5pdCBpbml0X3RzYyhjaGFyKiBvdmVycmlkZSkK
IHsKQEAgLTQ0Miw2ICs0NTEsNyBAQAogCQkJCXByaW50aygiRGV0ZWN0ZWQgJWx1LiUwM2x1IE1I
eiBwcm9jZXNzb3IuXG4iLCBjcHVfa2h6IC8gMTAwMCwgY3B1X2toeiAlIDEwMDApOwogCQkJfQog
CQkJc2V0X2N5YzJuc19zY2FsZShjcHVfa2h6LzEwMDApOworCQkJaW5pdF92YXJpYWJsZV90c2Mo
KTsKIAkJCXJldHVybiAwOwogCQl9CiAJfQo=

------_=_NextPart_001_01C3BA43.40B53114
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C3BA43.40B53114--

