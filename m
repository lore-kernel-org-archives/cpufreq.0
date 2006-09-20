From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Wed, 20 Sep 2006 09:24:59 -0700
Message-ID: <EB12A50964762B4D8111D55B764A84549CCEE1@scsmsx413.amr.corp.intel.com>
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
To: Dave Jones <davej@redhat.com>, Bryan O'Sullivan <bos@serpentine.com>
Cc: cpufreq@lists.linux.org.uk


>-----Original Message-----
>From: Dave Jones [mailto:davej@redhat.com]=20
>Sent: Wednesday, September 20, 2006 8:36 AM
>To: Bryan O'Sullivan
>Cc: Pallipadi, Venkatesh; cpufreq@lists.linux.org.uk
>Subject: Re: No life from acpi-cpufreq, Pentium D 930, x86_64
>
>On Wed, Sep 20, 2006 at 08:34:35AM -0700, Bryan O'Sullivan wrote:
> > On Wed, 2006-09-20 at 01:42 -0700, Pallipadi, Venkatesh wrote:
> >=20
> > > There was a bug that got introduced in recent kernels and=20
>that was fixed
> > > with this patch here:
> > >=20
>http://www.kernel.org/git/?p=3Dlinux/kernel/git/torvalds/linux-2.
>6.git;a=3Dc
> > > ommit;h=3Da0cc621f52a4dea10c34eeed6eb4e36b26db63dc
> > >=20
> > > Can you try this patch and recompile your kernel and see=20
>whether that
> > > helps?
> >=20
> > I can try it, sure, but I'm not getting any error messages=20
>when I load
> > acpi-cpufreq, so it's not clear to me that I should expect=20
>this patch to
> > do anything.
> >=20
> > Does the Pentium D 930 actually support frequency scaling?
>
>You have 'est' in the flags, so yes.  speedstep-centrino might
>possibly work too.
>

Yes. As Dave said your processor supports speedstep. Whether your
platform (BIOS) supports it or not is the next question.=20

The patch will make acpi-cpufreq either succeed or fail cleanly rather
than hanging in there without doing anything. And again as Dave
mentioned, try both acpi-cpufreq and speedstep-centrino drivers. If you
are recompiling the kernel, it will be great if you can CONFIG
CPU_FREQ_DEBUG and pass cpufreq.debug=3D3 at boot parameter. That will
give some more debug messages that will help say where exactly it is
failing.

Thanks,
Venki
