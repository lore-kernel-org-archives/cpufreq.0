From: "Stijn Van Nieuwenhuyse" <stivani@gmail.com>
Subject: Re: Dell bios + cpufreqd problem
Date: Fri, 4 Aug 2006 17:45:44 +0200
Message-ID: <e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
References: <e29f4c3f0608030232n695737f6yd249b24f059f5c6e@mail.gmail.com>
	<1154606992.4302.496.camel@queen.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <1154606992.4302.496.camel@queen.suse.de>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: trenn@suse.de
Cc: cpufreq@lists.linux.org.uk

I have still the same problem with kernel version 2.6.17.7

Since which kernel version should this be fixed?

On 8/3/06, Thomas Renninger <trenn@suse.de> wrote:
> On Thu, 2006-08-03 at 11:32 +0200, Stijn Van Nieuwenhuyse wrote:
> > I have posted a couple of monts ago a bugreport about my cpufreq problems.
> > I have a Dell Latitude D800 with a Dothan Pentium M processor.
> > When I switched to ac adapter, the frequency was locked to 600 MHz
> > (frequency should be within 600 MHz and 600 MHz). In the meantime this
> > problem has been resolved.
> >
> > I have noticed approximately the same problem again while running cpufeqd.
> > If I only use cpufrequtils and set the governor with cpufreq-set,
> > everything seems to be working (when I switch to battery, the
> > processor is locked for approximately 15 seconds to 600 MHz, but
> > afterwards, everything is OK)
> > But if I use cpufreqd, the processor is locked to 600 MHz when I
> > switch to battery, and the maximum freqency does not get updated. A
> > workaround I have found is restarting the cpufreqd daemon.
> > (when I boot on battery power, cpufreq-info gives the correct output,
> > when I switch to ac adapter and to battery again, the problem occurs
> > again.
> >
> > Can somebody point my to a solution for my problem?
> >
> > I am running Gentoo Linux with 2.6.16-suspend2-r8 kernel.
>
> This problem should be fixed in more recent kernels.
>
>    Thomas
>
>
