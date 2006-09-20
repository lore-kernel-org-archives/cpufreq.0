From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: cpufreq and suspend
Date: Wed, 20 Sep 2006 16:32:02 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF153652@SAUSEXMB1.amd.com>
References: <200609202309.13897.lucke@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200609202309.13897.lucke@o2.pl>
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
Content-Type: text/plain; charset="us-ascii"
To: lucke@o2.pl, cpufreq@lists.linux.org.uk

> > It's been a busy week, and I just secured the system necessary to
> > do the testing.
> >
> > Currently, I cannot reproduce with OpenSUSE 10.1 and the powersave
> > tool.  The system goes into S3 and comes out fine.  Both cores are
> > available and seem to be switching.
> >
> > I'll set up suspend2 this afternoon and try again.
>=20
> Well, S3 doesn't work for me (doesn't want to wake up), thus=20
> I can't check how cpufreq behaves with it.

> The problem occurs with suspend to disk (just=20
> checked, not only with suspend2, but also with=20
> swsusp/powersave)

I've tested "powersave -U" on a 4P/4C AMD internal reference
design and on an HP Turion X2 laptop, both using the 1.60.2
driver in the SUSE 2.6.16.13 kernel.  Both systems go into
S4 properly and come out properly, and PowerNow! has entries
for each core before and after suspend/resume.

This may be a MB specific problem.
=20
> For completeness, MB is Asus A8N-E with latest BIOS.

Okay, I'll go try to dig one of those up.

-Mark Langsdorf
AMD, Inc.
