From: "Li, Shaohua" <shaohua.li@intel.com>
Subject: Deadlock occurs in cpufreq_userspace.c
Date: Wed, 4 Feb 2004 11:11:13 +0800
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <571ACEFD467F7749BC50E0A98C17CDD8D5FED0@PDSMSX403.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C3EACC.8BDB392D"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk
Cc: Dominik Brodowski <linux@dominikbrodowski.de>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C3EACC.8BDB392D
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

   Consider below 2 paths:

   1.cpufreq_set (lock userspace_sem) ->cpufreq_driver_target(lock
policy->lock)

   2.cpufreq_set_policy(lock policy->lock)->
__cpufreq_governor->cpufreq_governor_userspace (lock userspace_sem)

then deadlock occurs. Attached is the patch against 2.6. Please review
it.

=20

thanks,

David

=20


------_=_NextPart_001_01C3EACC.8BDB392D
Content-Type: application/x-zip-compressed;
	name="userspace.ZIP"
Content-Transfer-Encoding: base64
Content-Description: userspace.ZIP
Content-Disposition: attachment;
	filename="userspace.ZIP"

UEsDBBQAAAAIADRYRDDrtoJnIwIAAP8FAAAPAAAAdXNlcnNwYWNlLnBhdGNotZP/b5pAFMB/hr/i
+csCVQStthXWpV21jsRqV7W/LMvlhKe9FA92gLVJ//jdqejatVtMNwh58L6/zz18HuLShYjxfFmv
HtmhYAsUqR0k+VTgj0KSPJXahAZYDfTT91/6zcUQpixCF+wgDjG19+mgstAFZoLhgvEZCClSFnOo
VVe3HrLpFKwErBwssVHCa4NYlrXX5Fq9CW0MoO44h+Acuc0T97AJliMvrSheLpf3y9mAS5yolA1w
6m6z5TqtdUr97AyspuNUjqGsRK0BUpNmNGMBMJ5tR5rFsgiPxS6tkWY6aBqbgmGUpBuJuewJDflq
mvD0BEYpE49kHod5hGSGmTH64g/J1aA97nVM01TBmkScCw5Wx+/fnvc8pfs87pJB3yglccSCR+tT
kAvT0y1NC+MHbnzY1icpzqWhrGn2ASgBB9CO1WFRkI3OaQSrCBPuUCAElMtHRktziDSM4uAeJpg9
IPIivCi5slEewrNiGyfGt1BSzFZuLyHJmgnN7tJ1hK2EwqTaIZKJSv9yEFM57XCcd8/9vhxOAVFs
WUrmlNMZht/k53c4hZqnaYV1zjhRDRS2Yg6p97Y+dPm6D1166y2orbegdlxp7bsEefL7wUj1RCC9
V28BldwvrseXN52vpDu4JcPR4Nr946H+c2CO9xYu501IToGmtUJTP9kfzWb/k/z5/v+FT8+/8kfD
/0ro3Uuz+fl/0cFHxYPIP3YXZeo/AVBLAQIUCxQAAAAIADRYRDDrtoJnIwIAAP8FAAAPAAAAAAAA
AAEAIAAAAAAAAAB1c2Vyc3BhY2UucGF0Y2hQSwUGAAAAAAEAAQA9AAAAUAIAAAAA

------_=_NextPart_001_01C3EACC.8BDB392D
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

------_=_NextPart_001_01C3EACC.8BDB392D--

