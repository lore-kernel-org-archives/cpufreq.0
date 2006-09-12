From: "shin, jacob" <jacob.shin@amd.com>
Subject: RE: Sempron 2800+
Date: Tue, 12 Sep 2006 11:57:13 -0500
Message-ID: <B3870AD84389624BAF87A3C7B831499303FB29AD@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: Arik Raffael Funke <arik.funke@gmx.de>, cpufreq@lists.linux.org.uk

On Tuesday, September 12, 2006 11:03 AM Arik Raffael Funke wrote:

> dmesg | grep powern reports nothing at all... Is that supposed to be a
> good or bad thing? I fear for the latter. ;-)
>=20
> Is there anything else I could provide to help with diagnosis?

It is very possible that your Sempron does not support frequency
scaling.  Easy way to check is with cpuid instruction.

Could you compile and run the following and copy us on the output?

Thanks,

Jacob Shin
AMD, Inc.

---

#include <stdio.h>

int main() {
	unsigned int my_edx;

	asm ("cpuid"
		: "=3Dd"(my_edx)
		: "a"(0x80000007)
	);

	printf("%08x\n", my_edx);
	return 0;
}
