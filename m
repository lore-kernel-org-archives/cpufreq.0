From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: post-OLS pending cpufreq patches
Date: Tue, 3 Aug 2004 08:06:47 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <88056F38E9E48644A0F562A38C64FB600283BF98@scsmsx403.amr.corp.intel.com>
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
To: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk, Dominik Brodowski <linux@dominikbrodowski.de>


Sorry about all the missing parts and the confusions about this one.
I was using cpufreq patch over latest mm tree, which has all of these=20
missing changes/includes. So, everything worked fine in my local=20
tests yesterday.

Thanks,
Venki =20

>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Tuesday, August 03, 2004 7:20 AM
>To: Pallipadi, Venkatesh; cpufreq@www.linux.org.uk
>Subject: Re: post-OLS pending cpufreq patches
>
>On Tue, Aug 03, 2004 at 04:07:50PM +0200, Dominik Brodowski wrote:
>
> > >  >  #include <acpi/processor.h>
> > >  >=20
> > >  > is only included around ~300, AFAICS [even in Venki's=20
>patch]... and if you=20
> > >  > move that above to line ~25 [but please only=20
>#ifdef'ed], you need to
> > >  >=20
> > >  >  #include <linux/acpi.h>
> > >  >=20
> > >  > first.
> > >  >=20
> > >  > Could you try that out, please?
> > >=20
> > > getting closer. just some missing defs introduced by this=20
>patch now.
> >=20
> > That's the patch to include/acpi/processor.h I was talking about...
> >=20
> > but that is actually include/asm/acpi.h, as can be seen here:
> > http://bugzilla.kernel.org/attachment.cgi?id=3D2919&action=3Dview
> >=20
> > Can you try out applying _only_ the hunk for=20
>include/asm-i386/acpi.h,
> > please?
>
>Yeah, that works.  Or compiles at least, I don't have centrino hardware
>to test this.  I'll check it in, and see who screams.
>
>		Dave
>
>
