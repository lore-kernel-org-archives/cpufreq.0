From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: cpufreq and suspend
Date: Wed, 20 Sep 2006 13:53:40 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF15364F@SAUSEXMB1.amd.com>
References: <200609202044.52726.lucke@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
In-Reply-To: <200609202044.52726.lucke@o2.pl>
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
To: lucke@o2.pl, cpufreq@lists.linux.org.uk


> >>http://lists.suspend2.net/lurker/message/20060827.234345.486
> 617dc.en.html
> >>=20
> >> Forgive me if this issue has been already mentioned, I can't=20
> >> seem to find a way to search through archives.
>=20
> >I'll go take a look at this.
>=20
> Is there any hope for a solution to this problem, Mark et al?

It's been a busy week, and I just secured the system necessary to
do the testing.

Currently, I cannot reproduce with OpenSUSE 10.1 and the powersave
tool.  The system goes into S3 and comes out fine.  Both cores are
available and seem to be switching.

I'll set up suspend2 this afternoon and try again.

-Mark Langsdorf
AMD, Inc.
