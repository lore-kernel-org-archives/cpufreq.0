From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: cpu-freq causing kernel lock-up after upgrading to 1GB ram.
Date: Mon, 16 May 2005 10:19:07 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84301CFC017@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Nebojsa Trpkovic <trxman@gmail.com>, cpufreq@lists.linux.org.uk

If this problem also occurs on Windows, please report
it to your motherboard manufacturer immediately.  They'll
get it fixed.

-Mark Langsdorf
AMD, Inc.

> -----Original Message-----
> From: cpufreq-bounces@lists.linux.org.uk=20
> [mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> Nebojsa Trpkovic
> Sent: Sunday, May 15, 2005 6:50 PM
> To: cpufreq@lists.linux.org.uk
> Subject: Re: cpu-freq causing kernel lock-up after upgrading=20
> to 1GB ram.
>=20
>=20
> Same problem here - VNF3-250 - if there's one RAM module=20
> C'n'Q works fine, and if I put two modules it freezes every=20
> time I try to change frequency, no matter linux or windows.=20
> So, it's not cpufreq related problem - it just buggy VNF3-250=20
> C'n'Q inplementation.
>=20
>=20
>=20
>=20
> chris stones wrote:
>=20
> > This is my first attempt at a bug report, so forgive me for=20
> making a=20
> > mess, I will try my best.
> >
> > -------------------------
> > hardware:
> > -------------------------
> > mobo: Chaintech VNF3-250
> > chipset: nForce-3
> > CPU: amd64 Athlon 3400+
> > Ram: 2 * Kingston 512Meg DDR400 PC3200 2T timeing 3-3-8-3.=20
> (total 1GB)=20
> > Swap : 1.3 Gb.
> >
> > --------------------------
> > software:
> > --------------------------
> > Distro: Gentoo 2005.0 (comiped as 64bit with multilib)
> > GCC: gcc version 3.4.3 20041125 (Gentoo Linux 3.4.3-r1, ssp-3.4.3-0,
> > pie-8.7.7)
> > kernel versions: gentoo 2.6.11-r7; vanilla-2.6.10; vanilla-2.6.11.9
> >
> > --------------------------
> > description:
> > --------------------------
> > I have been using the modules freq_table, cpufreq_ondemand,=20
> > powernow_k8 to regulate my cpu clock for over 6 months with the=20
> > hardware configureation shown above, minus one 512meg ram module.
> >
> > Recently, i shutdown the box, and added the second memory=20
> module. At=20
> > the time, the cpu_fre drivers were compiled into the=20
> kernel, shortly=20
> > after booting, the system would freese when cpu_freq=20
> lowered my cpu to=20
> > its idle state of 1Ghz.
> >
> > These conditions must all be met to cause the lock-up.
> > 1) Both Ram moodules are used (1GB ram)
> > 2) the modules freq_table, cpufreq_ondemand, powernow_k8 are loaded.
> > 3) The lockup occurs when the cpu is slowing down from a period of=20
> > heavy load.
> >
> > 2 hours running memtest86 shows that my memory is not the problem.
> >
> > one one occasion, the kernel gave a memory dump before the=20
> freeze. i=20
> > regret i didnt take note of its rull contents, but a function trace=20
> > line mentioned a cpu_freq function call.
> >
> > If i remove one of the 512meg memory modules, the cpu_freq=20
> > performsperfectly, as it has for the past 6 months.
> >
> > Thankyou for taking the time to read my post.
> > Is there anything i can do (other than go without  ram or=20
> cpu_freq) to=20
> > solve this ? is there any more information you require from me ?
> >
> > I have googled, but found no other similar bug reports.
> >
> > From Chris.stones@gmail.com.
> >
> > _______________________________________________
> > Cpufreq mailing list
> > Cpufreq@lists.linux.org.uk=20
> > http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
>=20
>=20
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk=20
> http://lists.linux.org.uk/mailman/listinfo/cpu> freq
>=20
>=20
