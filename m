From: "Zhu, Yi" <yi.zhu@intel.com>
Subject: RE: how to get Pentium 4 multiplier
Date: Thu, 10 Jun 2004 17:24:45 +0800
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3ACA40606221794F80A5670F0AF15F8403BD553A@pdsmsx403>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

Dominik Brodowski wrote:
> On Thu, Jun 10, 2004 at 01:55:13PM +0800, Zhu, Yi wrote:
>> I compiled my 2.6.7-rc3 kernel with SPEEDSTEP_DEBUG and dmesg gives:
>>=20
>> speedstep-lib: P4 - MSR_EBC_FREQUENCY_ID: 0xa201f000 0x0
>> speedstep-lib: P4 - FSB 100000 kHz; Multiplier 162
>>=20
>> You can find more detailed information here:
>> http://bugme.osdl.org/show_bug.cgi?id=3D2754
>=20
> Hm, these are the first (two) reports of invalid entries in
> MSR_EBC_FREQUENCY_ID for p4(m)s -- on many other systems
> (including but not limited to my own) it works fine...=20

The P4M machine in the bug report and my own P4 desktop have the
problem. So the MSR method is broken.

> maybe this is limited to the D stepping?

What's that?

> Problem is string parsing is ugly, some P4 processors print
> their speed, IIRC, in MHz, others in GHz, etc.

String parsing is ugly, but it is better than doing it wrong. MHz and
GHz won't be that big problem, right? And I saw recent patch tries
to find Mobile P4 in the string...

> For the p4-clockmod case, we might go back using cpu_khz for
> determining current CPU frequency

This is the case reported in the bugzilla. When will this happen?

>  -- and for speedstep-ich
> and the p4-m problem reported in the bug, I'd like to get more debug
> info=20

Sure. I had the machine with me now. I can provide whatever you want.

>=20
> 	Dominik

Thanks,
-yi
