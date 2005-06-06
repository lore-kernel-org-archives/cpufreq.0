From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: Temporary freezes in AMD Sempron 2800+
Date: Mon, 6 Jun 2005 14:54:42 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC0D9@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Ramkumar R <andyetitmoves@gmail.com>, Michal Pytasz <mpytasz@posejdon.wpk.p.lodz.pl>, cpufreq@lists.linux.org.uk

> yeah, one more question remains...does sempron have only 2=20
> frequency levels...that's what dmesg and the sys file seem to=20
> indicate....though i've read that amd processors have quite a=20
> few speed levels (is that only for the athlon series ?)

The powernow driver reads the data provided from the BIOS.
If the BIOS provides an incorrect number of pstates, the
driver has no way of knowing that there are other states.

How many pstates you have is determined by the frequency of
the processor.  A Sempron 2800+ is a 1.6 GHz processor and
should only have 2 pstates - high and low.  It looks like
your system is set up correctly.

-Mark Langsdorf
AMD, Inc.
