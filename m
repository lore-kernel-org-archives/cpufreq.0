From: "Joseph Xu" <josephzxu@gmail.com>
Subject: problem in sysfs_set_policy
Date: Sun, 22 Jun 2008 22:38:09 -0400
Message-ID: <bc342bf90806221938k34788a57v991396c371bf4943@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2599_31732319.1214188689276"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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

------=_Part_2599_31732319.1214188689276
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi everyone:

I ran into a bug using cpufreqd, which utilizes cpufrequtils to set
the CPU frequency. In particular, if you switch from an old policy
whose minimum frequency is greater than the new policy's max
frequency, writing the new max value to cpufreq/scaling_max_freq in
sysfs_set_policy will fail on my computer because it doesn't allow max
values that are lower than min values at any time. I don't know if
other people have run into this problem before, but I don't see any
fixes in the new release, so I've made a small patch that reads the
minimum value from file first and checks if the new max is less than
the old min. If it is, the patched version will write the new min
value before the new max value, and this solves the problem.

Joseph

------=_Part_2599_31732319.1214188689276
Content-Type: application/octet-stream; name=patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fhsgh9c10
Content-Disposition: attachment; filename=patch

LS0tIC4uLy4uL2NwdWZyZXF1dGlscy0wMDMvbGliL3N5c2ZzLmMJMjAwOC0wNS0yNSAwNzo0OToz
MC4wMDAwMDAwMDAgLTA0MDAKKysrIHN5c2ZzLmMJMjAwOC0wNi0yMiAyMjoyNToxOS4wMDAwMDAw
MDAgLTA0MDAKQEAgLTQ5NSw2ICs0OTUsOCBAQAogCWNoYXIgbWF4W1NZU0ZTX1BBVEhfTUFYXTsK
IAljaGFyIGdvdltTWVNGU19QQVRIX01BWF07CiAJaW50IHJldDsKKyAgdW5zaWduZWQgbG9uZyBv
bGRfbWluOworICBpbnQgd3JpdGVfbWF4X2ZpcnN0OwogCiAJaWYgKCFwb2xpY3kgfHwgIShwb2xp
Y3ktPmdvdmVybm9yKSkKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC01MDgsMTQgKzUxMCwyNSBAQAog
CXNucHJpbnRmKG1pbiwgU1lTRlNfUEFUSF9NQVgsICIlbHUiLCBwb2xpY3ktPm1pbik7CiAJc25w
cmludGYobWF4LCBTWVNGU19QQVRIX01BWCwgIiVsdSIsIHBvbGljeS0+bWF4KTsKIAotCXJldCA9
IHN5c2ZzX3dyaXRlX29uZV92YWx1ZShjcHUsIFdSSVRFX1NDQUxJTkdfTUFYX0ZSRVEsIG1heCwg
c3RybGVuKG1heCkpOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7CisgIG9sZF9taW4gPSBzeXNm
c19nZXRfb25lX3ZhbHVlKGNwdSwgU0NBTElOR19NSU5fRlJFUSk7CisgIHdyaXRlX21heF9maXJz
dCA9IChvbGRfbWluICYmIChwb2xpY3ktPm1heCA8IG9sZF9taW4pID8gMCA6IDEpOworCisgIGlm
ICh3cml0ZV9tYXhfZmlyc3QpIHsKKyAgICByZXQgPSBzeXNmc193cml0ZV9vbmVfdmFsdWUoY3B1
LCBXUklURV9TQ0FMSU5HX01BWF9GUkVRLCBtYXgsIHN0cmxlbihtYXgpKTsKKyAgICBpZiAocmV0
KQorICAgICAgcmV0dXJuIHJldDsKKyAgfQogCiAJcmV0ID0gc3lzZnNfd3JpdGVfb25lX3ZhbHVl
KGNwdSwgV1JJVEVfU0NBTElOR19NSU5fRlJFUSwgbWluLCBzdHJsZW4obWluKSk7CiAJaWYgKHJl
dCkKIAkJcmV0dXJuIHJldDsKIAorICBpZiAoIXdyaXRlX21heF9maXJzdCkgeworICAgIHJldCA9
IHN5c2ZzX3dyaXRlX29uZV92YWx1ZShjcHUsIFdSSVRFX1NDQUxJTkdfTUFYX0ZSRVEsIG1heCwg
c3RybGVuKG1heCkpOworICAgIGlmIChyZXQpCisgICAgICByZXR1cm4gcmV0OworICB9CisKIAly
ZXR1cm4gc3lzZnNfd3JpdGVfb25lX3ZhbHVlKGNwdSwgV1JJVEVfU0NBTElOR19HT1ZFUk5PUiwg
Z292LCBzdHJsZW4oZ292KSk7CiB9CiAK
------=_Part_2599_31732319.1214188689276
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

------=_Part_2599_31732319.1214188689276--

