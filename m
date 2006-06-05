From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: RE: [PATCH] Hardware P-state driver for AMD Opterons, etc.
Date: Mon, 5 Jun 2006 10:18:10 -0500
Message-ID: <84EA05E2CA77634C82730353CBE3A84305350551@SAUSEXMB1.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

>  > On Fri, Jun 02, 2006 at 05:45:24PM -0500, Langsdorf, Mark wrote:
>  > > +static int cpu_family =3D CPU_OPTERON;  >  > ...
>  >=20
>  > > +	if (cpu_family)
>  > > +		return 0;
>  > > +
>  >
>  > ...
>  >=20
>  > > +	if (cpu_family) {
>  > > +		rdmsr(MSR_PSTATE_STATUS, lo, hi);
>  >
>  > ...
>  >
>  > I'd prefer it if all these if cases would be made explicit:
>  >
>  >=20
>  > 	if (cpu_family =3D=3D CPU_OPTERON)
>  >
>  > as that makes the code much more readable.
>=20
> I'll second that, but I'll prefer that as a separate diff as=20
> I've already started cleaning up the whitespace damage in the=20
> previous diff, so I'll apply that in a few minutes.
>=20
> Mark, your editor seems to use a mix of spaces and tabs,=20
> which looks really strange. I've fixed up the few cases that=20
> stood out, so you may want to base your next diff on what=20
> turns up in -mm4 when Andrew releases that tree.

I'll do that.

Sorry for the whitespace confusion; I thought I was running=20
pure vim and it was doing the right thing.

-Mark Langsdorf
AMD, Inc.
