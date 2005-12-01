From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [powernow-k8] some wrong frequencies on opterons 252, howto
 find them?
Date: Thu, 1 Dec 2005 10:13:48 -0600
Message-ID: <84EA05E2CA77634C82730353CBE3A843032189C1@SAUSEXMB1.amd.com>
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
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

> > That function scares me.  It's only useful for people with a mostly=20
> > working set of _PSS objects, since it won't generate the irt, rvo,=20
> > pllock, etc.
>=20
> Which happens to be the case of the HP...
>=20
> > People attempting to use it
> > should be very careful, since incorrect fid/vid pairs
> > will hardlock the machine and potentially damage the
> > processor.  I definitely don't want it in the mainstream code.
>=20
> Note that I never wanted this function or any other=20
> "official" way to change the configuration at run-time going=20
> to mainstream. You can look at the archive that I am one=20
> which won't recommand this kind of stuff.  But that doesn't=20
> means that we can't help people with some kind of black magic=20
> sometimes.
>=20
> Attached a version without the store function, and take care=20
> of your remarks.

Looks good.  We'll add it to our internal copies, also.

-Mark Langsdorf
AMD, Inc.
