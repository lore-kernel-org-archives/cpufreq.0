From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: [PATCH] 2/2 fix driver removal code to clean up all governors
Date: Thu, 10 Nov 2005 16:53:57 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A8430321891A@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C5E649.A1D90D6E"
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: "shin, jacob" <jacob.shin@amd.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5E649.A1D90D6E
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This patch fixes a bug that causes a segfault when the
powernow-k8 driver is removed while the ondemand=20
governor is running.

Signed-off-by: Jacob Shin <jacob.shin@amd.com>
Signed-off-by: Mark Langsdorf <mark.langsdorf@amd.com>

------_=_NextPart_001_01C5E649.A1D90D6E
Content-Type: application/octet-stream;
 name=cpufreq-gov_stop-fix.patch
Content-Transfer-Encoding: base64
Content-Description: cpufreq-gov_stop-fix.patch
Content-Disposition: attachment;
 filename=cpufreq-gov_stop-fix.patch

LS0tIGNwdWZyZXEuYy5vcmlnCTIwMDUtMTEtMTAgMTM6MzI6NDEuMDAwMDAwMDAwIC0wNjAwCisr
KyBjcHVmcmVxLmMJMjAwNS0xMS0xMCAxMzozMzoxOS4wMDAwMDAwMDAgLTA2MDAKQEAgLTc3Miw3
ICs3NzIsNiBAQCBzdGF0aWMgaW50IGNwdWZyZXFfcmVtb3ZlX2RldiAoc3RydWN0IHN5CiAJZG93
bigmZGF0YS0+bG9jayk7CiAJaWYgKGNwdWZyZXFfZHJpdmVyLT50YXJnZXQpCiAJCV9fY3B1ZnJl
cV9nb3Zlcm5vcihkYXRhLCBDUFVGUkVRX0dPVl9TVE9QKTsKLQljcHVmcmVxX2RyaXZlci0+dGFy
Z2V0ID0gTlVMTDsKIAl1cCgmZGF0YS0+bG9jayk7CiAKIAlrb2JqZWN0X3VucmVnaXN0ZXIoJmRh
dGEtPmtvYmopOwo=

------_=_NextPart_001_01C5E649.A1D90D6E
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C5E649.A1D90D6E--


