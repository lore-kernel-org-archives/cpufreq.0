From: Thomas Renninger <trenn@suse.de>
Subject: Re: Dell bios + cpufreqd problem
Date: Fri, 4 Aug 2006 23:10:04 +0200 (CEST)
Message-ID: <8355938.1154725804784.SLOX.WebMail.wwwrun@imap-dhs.suse.de>
References: <e29f4c3f0608030232n695737f6yd249b24f059f5c6e@mail.gmail.com>
	<1154606992.4302.496.camel@queen.suse.de>
	<e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: Stijn Van Nieuwenhuyse <stivani@gmail.com>
Cc: cpufreq@lists.linux.org.uk

Am Fr 04.08.2006 17:45 schrieb Stijn Van Nieuwenhuyse
<stivani@gmail.com>:
> On 8/3/06, Thomas Renninger <trenn@suse.de> wrote:
> > On Thu, 2006-08-03 at 11:32 +0200, Stijn Van Nieuwenhuyse wrote:
> > > I have posted a couple of monts ago a bugreport about my cpufreq
> > > problems.
> > > I have a Dell Latitude D800 with a Dothan Pentium M processor.
> > > When I switched to ac adapter, the frequency was locked to 600 MHz
> > > (frequency should be within 600 MHz and 600 MHz). In the meantime
> > > this
> > > problem has been resolved.
> > >
> > > I have noticed approximately the same problem again while running
> > > cpufeqd.
> > > If I only use cpufrequtils and set the governor with cpufreq-set,
> > > everything seems to be working (when I switch to battery, the
> > > processor is locked for approximately 15 seconds to 600 MHz, but
> > > afterwards, everything is OK)
> > > But if I use cpufreqd, the processor is locked to 600 MHz when I
> > > switch to battery, and the maximum freqency does not get updated.
> > > A
> > > workaround I have found is restarting the cpufreqd daemon.
> > > (when I boot on battery power, cpufreq-info gives the correct
> > > output,
> > > when I switch to ac adapter and to battery again, the problem
> > > occurs
> > > again.
> > >
> > > Can somebody point my to a solution for my problem?
These Dells behave very strange:
if you unplug AC adapter:
=C2=A0=C2=A0=C2=A0 - bios limits processor to the lowest freq
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (scaling_max_freq =3D=3D scaling_min_freq in=
 /sys/devices/.../cpufreq)
=C2=A0=C2=A0=C2=A0 - after some seconds bios allows all freqs again
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scaling_max_freq is increased again
normally the kernel should remember the last freq told from cpufreqd if
in
userspace governor mode.
You can watch acpi processor events when the bios limits frequencies
and allows them again (last value, if it's zero all frequencies are
allowed).
Maybe cpufreqd gets confused by this?
=C2=A0
=C2=A0=C2=A0=C2=A0 Thomas
