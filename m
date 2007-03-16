From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: Report the number of processors in PowerNow-k8 correctly
Date: Fri, 16 Mar 2007 10:50:26 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDFD96723@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C767E2.D0D85ADB"
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

------_=_NextPart_001_01C767E2.D0D85ADB
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The PowerNow! driver for Opteron reports the number of
cores in the system, but claims to report the number of
processors.  Fix this minor cosmetic bug.

Signed-Off-by: Bhavana Nagendra <bhavana.nagendra@amd.com>
Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>

------_=_NextPart_001_01C767E2.D0D85ADB
Content-Type: application/octet-stream;
 name=Correct_number_of_procs.patch
Content-Transfer-Encoding: base64
Content-Description: Correct_number_of_procs.patch
Content-Disposition: attachment;
 filename=Correct_number_of_procs.patch

LS0tIGxpbnV4LTIuNi4xOC54ODZfNjQvYXJjaC9pMzg2L2tlcm5lbC9jcHUvY3B1ZnJlcS9wb3dl
cm5vdy1rOC5jLm9yaWcJMjAwNy0wMy0xNSAwNTo1MzoxMi4wMDAwMDAwMDAgLTA0MDANCisrKyBs
aW51eC0yLjYuMTgueDg2XzY0L2FyY2gvaTM4Ni9rZXJuZWwvY3B1L2NwdWZyZXEvcG93ZXJub3ct
azguYwkyMDA3LTAzLTE3IDA0OjQwOjQ5LjAwMDAwMDAwMCAtMDQwMA0KQEAgLTE0MjUsOCArMTQy
NSw4IEBAIHN0YXRpYyBpbnQgX19jcHVpbml0IHBvd2Vybm93azhfaW5pdCh2b2kNCiAJCQl9DQog
CQl9DQogCQlwcmludGsoS0VSTl9JTkZPIFBGWCAiRm91bmQgJWQgJXMgIg0KLQkJCSJwcm9jZXNz
b3JzICgiIFZFUlNJT04gIilcbiIsIHN1cHBvcnRlZF9jcHVzLA0KLQkJCWJvb3RfY3B1X2RhdGEu
eDg2X21vZGVsX2lkKTsNCisJCQkicHJvY2Vzc29ycyAoJWQgY3B1IGNvcmVzKSAoIiBWRVJTSU9O
ICIpXG4iLCBzdXBwb3J0ZWRfY3B1cy9jcHVfZGF0YVswXS5ib290ZWRfY29yZXMsDQorCQkJYm9v
dF9jcHVfZGF0YS54ODZfbW9kZWxfaWQsIHN1cHBvcnRlZF9jcHVzKTsNCiAJCXJldHVybiBjcHVm
cmVxX3JlZ2lzdGVyX2RyaXZlcigmY3B1ZnJlcV9hbWQ2NF9kcml2ZXIpOw0KIAl9DQogDQo=

------_=_NextPart_001_01C767E2.D0D85ADB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C767E2.D0D85ADB--



