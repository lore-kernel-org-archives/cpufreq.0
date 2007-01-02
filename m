From: Dave Jones <davej@redhat.com>
Subject: Re: Power mgmt / CPUFREQ on Via C7 (Esther)
Date: Tue, 2 Jan 2007 18:19:49 -0500
Message-ID: <20070102231949.GE18033@redhat.com>
References: <5317.195.215.10.251.1167740225.squirrel@195.41.226.86>
	<20070102173601.GD7656@redhat.com> <459AA1F9.3040701@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <459AA1F9.3040701@interia.pl>
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
Content-Type: text/plain; charset="windows-1252"
To: =?utf-8?B?UmFmYcWC?= Bilski <rafalbilski@interia.pl>
Cc: cpufreq@lists.linux.org.uk

On Tue, Jan 02, 2007 at 07:18:33PM +0100, Rafa=C5=82 Bilski wrote:

 > > Given speedstep-centrino is due to be obsoleted by acpi-cpufreq at som=
e stage,
 > > the feature of using hardcoded tables probably needs to be added to
 > > acpi-cpufreq at some point too.
 > >=20
 > Beauty of "Enhanced PowerSaver" is in that hardcoded tables are not nece=
ssary.=20
 > Would be very easy to add ACPI independent driver for these CPU's. If so=
mebody=20
 > would test it then I can try.
 > What do You think?

That's an alternative.  It wouldn't look much different from the existing
speedstep-centrino.c though.

		Dave

--=20
http://www.codemonkey.org.uk
