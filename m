From: Thomas Renninger <trenn@suse.de>
Subject: Re: Pentium D 915 support
Date: Thu, 03 Aug 2006 16:56:49 +0200
Message-ID: <1154617009.4302.515.camel@queen.suse.de>
References: <1154265136.21063.10.camel@skylla.slagter.name>
	<44CCD154.3080606@linux.intel.com>
	<1154275129.21063.31.camel@skylla.slagter.name>
	<1154605493.4302.494.camel@queen.suse.de>
	<1154605725.14206.22.camel@localhost>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <1154605725.14206.22.camel@localhost>
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
To: Erik Slagter <erik@slagter.name>
Cc: cpufreq@lists.linux.org.uk

On Thu, 2006-08-03 at 13:48 +0200, Erik Slagter wrote:
> On do, 2006-08-03 at 13:44 +0200, Thomas Renninger wrote:
> > > Please note the amount of repeated same frequency.
> > I already saw something similar.
> > This is BIOS information, they probably want to take care that no
> > performance is lost and define 9 high and one low step.
> 
> What do you mean?
available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80
GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz

They define 9 2.8 GHz frequency steps and one 2.4 GHz.
That means if OS is going down with speed step by step it will take a
while until you reach 2.4 GHz.
This could be intended (avoid possible performance losses), but also
just be a BIOS bug.

> 
> > > Last but not least: the loading or unloading of the module doesn't have
> > > any effect on the actual power consumption, even with powersave governor
> > > and both cores at 2.4 Ghz (both at 140 W).
> > Strange. 2.4 GHz is still a lot?
> > 
> > Have you already searched for a new BIOS, if not better do that first.
> 
> The only difference between my BIOS version and the one available for
> download is the support for "new cpu's" according to the ASUS website.
No idea whether it helps, but I would give it a try.

Maybe you find some specs on the Intel site what speed steps should be
supported and how many power/temperature gain you can get. 2.4 GHz
doesn't sound like you save a lot of energy...

   Thomas
