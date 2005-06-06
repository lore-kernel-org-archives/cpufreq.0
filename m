From: =?iso-8859-2?q?Micha=B3_Pytasz?= <mpytasz@pai.net.pl>
Subject: Re: Temporary freezes in AMD Sempron 2800+
Date: Mon, 6 Jun 2005 19:06:16 +0200
Message-ID: <200506061906.16327.mpytasz@pai.net.pl>
References: <9a9bfc1705060607494838bc6c@mail.gmail.com>
	<200506061659.19854.mpytasz@pai.net.pl>
	<9a9bfc1705060609302b5d803f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9a9bfc1705060609302b5d803f@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"
To: Ramkumar R <andyetitmoves@gmail.com>, cpufreq@lists.linux.org.uk

Hi,

On Monday 06 of June 2005 18:30, Ramkumar R wrote:
> I set the governor to userspace and tried echoing one of the speeds in
> scaling_available_frequencies to scaling_setspeed...it still hung for
> a second or two...just to ensure that, i did run `powernowd
> -vvvd`...everytime the speed changed to one of the valid frequencies,
> it hung...and one more observation, i've heard that amd supports quite
> a few frequencies...but scaling_available_frequencies just shows up
> 1600000 and 800000.
>
> and yes, i don't ACPI_CONTAINER in my kernel...
>
> Ramkumar.
>
> On 6/6/05, Micha=B3 Pytasz <mpytasz@pai.net.pl> wrote:
> > Hi,
> >
> > Dnia poniedzia=B3ek, 6 czerwca 2005 16:49, Ramkumar R napisa=B3:
> > > Hi!
> > >
> > > I have a laptop with an AMD Sempron 2800+ (Acer Aspire 3002NLC). The
> > > machine seems to get unresponsive every time the frequency changes
> > > (the music stops for a second, say)...I tested this by using the
> > > ondemand kernel governor. I use linux-2.6.12-rc4-ck1 with the inotify
> > > patch. (With two more modules, fuse and cdfs, but I guess that
> > > wouldn't matter much). Watching the current frequency file in /sys
> > > shows that this sudden freeze occurs whenever the value changes.
> > >
> > > Thanx,
> > > Ramkumar.
> >
> > 1. Did You try powernowd with userspace govenor?
> > I have similar laptop - Acer Aspire 1362 and had problems mentioned
> > below, it worked better that way.
> >
> > 2. Dou You have ACPI004,PNP0A05 and PNP0A06 Container Driver enabled ?
> > (if so disable it and retest) i had issues with this part, it's
> > "experimental" in power management->ACPI section of kernel config. (poth
> > with mobile sempron 2800 as well as desktop Athlon64
> >
> > Michal

Ok,=20

Did You try if it works stable with Windows (scaling frequency) ?=20
Maybe You have memory-related problems ?

Michal
