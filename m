From: "Stijn Van Nieuwenhuyse" <stivani@gmail.com>
Subject: Re: Dell bios + cpufreqd problem
Date: Sat, 5 Aug 2006 12:57:33 +0200
Message-ID: <e29f4c3f0608050357x1f536e82s1f98696b8a16c84f@mail.gmail.com>
References: <e29f4c3f0608030232n695737f6yd249b24f059f5c6e@mail.gmail.com>
	<1154606992.4302.496.camel@queen.suse.de>
	<e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
	<8355938.1154725804784.SLOX.WebMail.wwwrun@imap-dhs.suse.de>
	<20060805082832.GA4060@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060805082832.GA4060@inferi.kami.home>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Renninger <trenn@suse.de>, Stijn Van Nieuwenhuyse <stivani@gmail.com>, cpufreq@lists.linux.org.uk

I get this in the logs, while using cpufreqd 2.1.1 and the example
cpufreqd.conf which can be found on the cpufreqd website:

Aug  5 12:51:50 asterix cpufreqd: cpufreqd_set_profile     : I haven't
been able to set the chosen policy for CPU0. I set
1700000-600000-ondemand System says 600000-600000-ondemand
Aug  5 12:51:55 asterix logger: ACPI group battery / action battery is
not defined
Aug  5 12:51:55 asterix logger: ACPI group battery / action battery is
not defined
Aug  5 12:52:06 asterix logger: ACPI group processor / action
processor is not defined
Aug  5 12:52:40 asterix cpufreqd: cpufreqd_set_profile     : I haven't
been able to set the chosen policy for CPU0. I set
1700000-1700000-performance System says 1700000-600000-performance
Aug  5 12:52:40 asterix logger: ACPI group ac_adapter / action
ac_adapter is not defined
Aug  5 12:52:40 asterix logger: ACPI group battery / action battery is
not defined
Aug  5 12:52:47 asterix logger: ACPI group battery / action battery is
not defined
Aug  5 12:52:47 asterix logger: ACPI group battery / action battery is
not defined


On 8/5/06, Mattia Dongili <malattia@linux.it> wrote:
> On Fri, Aug 04, 2006 at 11:10:04PM +0200, Thomas Renninger wrote:
> > Am Fr 04.08.2006 17:45 schrieb Stijn Van Nieuwenhuyse
> > <stivani@gmail.com>:
> > > On 8/3/06, Thomas Renninger <trenn@suse.de> wrote:
> > > > On Thu, 2006-08-03 at 11:32 +0200, Stijn Van Nieuwenhuyse wrote:
> > > > > I have posted a couple of monts ago a bugreport about my cpufreq
> > > > > problems.
> > > > > I have a Dell Latitude D800 with a Dothan Pentium M processor.
> > > > > When I switched to ac adapter, the frequency was locked to 600 MHz
> > > > > (frequency should be within 600 MHz and 600 MHz). In the meantime
> > > > > this
> > > > > problem has been resolved.
> > > > >
> > > > > I have noticed approximately the same problem again while running
> > > > > cpufeqd.
> > > > > If I only use cpufrequtils and set the governor with cpufreq-set,
> > > > > everything seems to be working (when I switch to battery, the
> > > > > processor is locked for approximately 15 seconds to 600 MHz, but
> > > > > afterwards, everything is OK)
> > > > > But if I use cpufreqd, the processor is locked to 600 MHz when I
> > > > > switch to battery, and the maximum freqency does not get updated.
> > > > > A
> > > > > workaround I have found is restarting the cpufreqd daemon.
> > > > > (when I boot on battery power, cpufreq-info gives the correct
> > > > > output,
> > > > > when I switch to ac adapter and to battery again, the problem
> > > > > occurs
> > > > > again.
> > > > >
> > > > > Can somebody point my to a solution for my problem?
> > These Dells behave very strange:
> > if you unplug AC adapter:
> > ?????? - bios limits processor to the lowest freq
> > ?????????? (scaling_max_freq == scaling_min_freq in
> /sys/devices/.../cpufreq)
> > ?????? - after some seconds bios allows all freqs again
> > ?????????? scaling_max_freq is increased again
> > normally the kernel should remember the last freq told from cpufreqd if
> > in
> > userspace governor mode.
> > You can watch acpi processor events when the bios limits frequencies
> > and allows them again (last value, if it's zero all frequencies are
> > allowed).
> > Maybe cpufreqd gets confused by this?
>
> probably, cpufreqd gets the available frequencies at startup, if it
> tries to set the higher frequency while the BIOS limits frequencies the
> it can get confused. If you want to check you can enable the
> "double_check" option in cpufreqd.conf, this will at lesat spit a
> warning in the logs.
> I'll see if I can make cpufreqd handle this Dell BIOS case.
>
> BTW: cpufreqd doesn't use the userspace governor :)
>
> --
> mattia
> :wq!
>
