From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] ondemand governor clean-ups
Date: Mon, 7 Feb 2005 13:15:54 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB6003F34677@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C50D5A.35FADDE9"
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
To: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@zenii.linux.org.uk, Eric Piel <Eric.Piel@tremplin-utc.net>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C50D5A.35FADDE9
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20
Thanks.
Dave/Dominik: Please Apply.

- Venki

Trivial ondemand governor clean-ups:
- change from sampling_rate_in_HZ() to the official function=20
usecs_to_jiffies().
- use for_each_online_cpu() to instead of using "if (cpu_online(i))"

Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

------_=_NextPart_001_01C50D5A.35FADDE9
Content-Type: application/octet-stream;
	name="ondemand-cleanup-macro-2.6.11-rc3.patch"
Content-Transfer-Encoding: base64
Content-Description: ondemand-cleanup-macro-2.6.11-rc3.patch
Content-Disposition: attachment;
	filename="ondemand-cleanup-macro-2.6.11-rc3.patch"

LS0tIGxpbnV4LTIuNi4xMS1yYzMvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYy5i
YWsJMjAwNS0wMi0wNiAyMzozNTo0MS4wMDAwMDAwMDAgKzAxMDANCisrKyBsaW51eC0yLjYuMTEt
cmMzL2RyaXZlcnMvY3B1ZnJlcS9jcHVmcmVxX29uZGVtYW5kLmMJMjAwNS0wMi0wNyAyMTo0NTox
OC4wMDAwMDAwMDAgKzAxMDANCkBAIC01Nyw3ICs1Nyw2IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQg
CQkJCWRlZl9zYW1wbGluZ19yYXQNCiAjZGVmaW5lIERFRl9TQU1QTElOR19SQVRFX0xBVEVOQ1lf
TVVMVElQTElFUgkoMTAwMCkNCiAjZGVmaW5lIERFRl9TQU1QTElOR19ET1dOX0ZBQ1RPUgkJKDEw
KQ0KICNkZWZpbmUgVFJBTlNJVElPTl9MQVRFTkNZX0xJTUlUCQkoMTAgKiAxMDAwKQ0KLSNkZWZp
bmUgc2FtcGxpbmdfcmF0ZV9pbl9IWih4KQkJCSgoKHggKiBIWikgPCAoMTAwMCAqIDEwMDApKT8x
OigoeCAqIEhaKSAvICgxMDAwICogMTAwMCkpKQ0KIA0KIHN0YXRpYyB2b2lkIGRvX2Ric190aW1l
cih2b2lkICpkYXRhKTsNCiANCkBAIC0yODEsNyArMjgwLDcgQEAgc3RhdGljIHZvaWQgZGJzX2No
ZWNrX2NwdShpbnQgY3B1KQ0KIAkvKiBTY2FsZSBpZGxlIHRpY2tzIGJ5IDEwMCBhbmQgY29tcGFy
ZSB3aXRoIHVwIGFuZCBkb3duIHRpY2tzICovDQogCWlkbGVfdGlja3MgKj0gMTAwOw0KIAl1cF9p
ZGxlX3RpY2tzID0gKDEwMCAtIGRic190dW5lcnNfaW5zLnVwX3RocmVzaG9sZCkgKg0KLQkJCXNh
bXBsaW5nX3JhdGVfaW5fSFooZGJzX3R1bmVyc19pbnMuc2FtcGxpbmdfcmF0ZSk7DQorCQkJdXNl
Y3NfdG9famlmZmllcyhkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRlKTsNCiANCiAJaWYgKGlk
bGVfdGlja3MgPCB1cF9pZGxlX3RpY2tzKSB7DQogCQlfX2NwdWZyZXFfZHJpdmVyX3RhcmdldChw
b2xpY3ksIHBvbGljeS0+bWF4LCANCkBAIC0zMjgsNyArMzI3LDcgQEAgc3RhdGljIHZvaWQgZGJz
X2NoZWNrX2NwdShpbnQgY3B1KQ0KIAlmcmVxX2Rvd25fc2FtcGxpbmdfcmF0ZSA9IGRic190dW5l
cnNfaW5zLnNhbXBsaW5nX3JhdGUgKg0KIAkJZGJzX3R1bmVyc19pbnMuc2FtcGxpbmdfZG93bl9m
YWN0b3I7DQogCWRvd25faWRsZV90aWNrcyA9ICgxMDAgLSBkYnNfdHVuZXJzX2lucy5kb3duX3Ro
cmVzaG9sZCkgKg0KLQkJCXNhbXBsaW5nX3JhdGVfaW5fSFooZnJlcV9kb3duX3NhbXBsaW5nX3Jh
dGUpOw0KKwkJCXVzZWNzX3RvX2ppZmZpZXMoZnJlcV9kb3duX3NhbXBsaW5nX3JhdGUpOw0KIA0K
IAlpZiAoaWRsZV90aWNrcyA+IGRvd25faWRsZV90aWNrcyApIHsNCiAJCWZyZXFfZG93bl9zdGVw
ID0gKDUgKiBwb2xpY3ktPm1heCkgLyAxMDA7DQpAQCAtMzQ4LDExICszNDcsMTAgQEAgc3RhdGlj
IHZvaWQgZG9fZGJzX3RpbWVyKHZvaWQgKmRhdGEpDQogeyANCiAJaW50IGk7DQogCWRvd24oJmRi
c19zZW0pOw0KLQlmb3IgKGkgPSAwOyBpIDwgTlJfQ1BVUzsgaSsrKQ0KLQkJaWYgKGNwdV9vbmxp
bmUoaSkpDQotCQkJZGJzX2NoZWNrX2NwdShpKTsNCisJZm9yX2VhY2hfb25saW5lX2NwdShpKQ0K
KwkJZGJzX2NoZWNrX2NwdShpKTsNCiAJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZkYnNfd29yaywg
DQotCQkJc2FtcGxpbmdfcmF0ZV9pbl9IWihkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRlKSk7
DQorCQkJdXNlY3NfdG9famlmZmllcyhkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRlKSk7DQog
CXVwKCZkYnNfc2VtKTsNCiB9IA0KIA0KQEAgLTM2MCw3ICszNTgsNyBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgZGJzX3RpbWVyX2luaXQodm9pZCkNCiB7DQogCUlOSVRfV09SSygmZGJzX3dvcmssIGRv
X2Ric190aW1lciwgTlVMTCk7DQogCXNjaGVkdWxlX2RlbGF5ZWRfd29yaygmZGJzX3dvcmssDQot
CQkJc2FtcGxpbmdfcmF0ZV9pbl9IWihkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRlKSk7DQor
CQkJdXNlY3NfdG9famlmZmllcyhkYnNfdHVuZXJzX2lucy5zYW1wbGluZ19yYXRlKSk7DQogCXJl
dHVybjsNCiB9DQogDQo=

------_=_NextPart_001_01C50D5A.35FADDE9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C50D5A.35FADDE9--

