From: =?iso-8859-2?q?Micha=B3_Pytasz?= <pytasz@lodz.home.pl>
Subject: Re: powernow-k8: Power state transitions not supported
Date: Tue, 29 Mar 2005 10:59:16 +0000
Message-ID: <200503291059.16320.pytasz@lodz.home.pl>
References: <1112085824.3156.13.camel@localhost.localdomain>
Reply-To: pytasz@lodz.home.pl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1112085824.3156.13.camel@localhost.localdomain>
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
To: cpufreq@lists.linux.org.uk

On Tuesday 29 of March 2005 08:43, Michael Pophal wrote:
> Hi,
> I tried the last 3 days to convince cpufreq to work with my new Semperon
> 2600+ (Socket 754).
> I also bought a new mainboard 'MSI K8T Neo-V'. It is a desktop (not
> mobile) processor!
> I compiled the kernel with the recommended settings. The result during
> startup:
> powernow-k8: Power state transitions not supported
Do You have cpuid in Your kernel?

> It seems to me, that this processor is not supported by cpufreq, isn't
> it?

I guess it is, however I might be wrong ;)

> I want to have a cheap processor, which is able to save power, because
> it is running the whole day. Do you have any recommendation which
> processor I should use. I'm going to change the Semperon 2600+ to try
> another combination (cpu + mainboard). Any hint is hightly apprecitated!
>
> Do you have a Semperon xx00+ (Socket 754) running on this 'Cool'n Quiet'
> mode? Which one works?

Do You have "Cool&Quiet" enabled in bios? (I have, I guess similar, mainboa=
rd=20
in my desktop, it's MSI K8T Neo2 - there is a bios option that enbles it).=
=20
When this option is disabled I get similar message ;)=20
Well, I have another problem with it, desktop with powernow-k8 is not as=20
stable as it ought to be - it hangs hard sometimes (Athlon64 3200+ s939).=20
Problem does not occur in a laptop, where I have Mobile Sempron 2800 s754=20
working. powernow-k8 is a module, I use powernowd.

Micha=B3=20
