From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 20:56:19 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111195619.GA25048@grep.be>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
	<20040111173547.GB5485@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040111173547.GB5485@dominikbrodowski.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Sun, Jan 11, 2004 at 06:35:47PM +0100, Dominik Brodowski wrote:
> On Sat, Jan 10, 2004 at 08:35:26PM +0100, Wouter Verhelst wrote:
> > That happens both when it's in P0 or P1.
> 
> So ACPI works to set the processor in P0 and P1?

Yes.

> If so, you really really should use the ACPI cpufreq driver instead of
> the p4-clockmod driver. The former will offer you true "SpeedStep"
> support, the latter only some clock modulation which won't save you
> much energy as ACPI supports the C2 idle state anyway. 

Ah, so what p4-clockmod does is not SpeedStep?

Hm. That sucks.

> > Not that it matters -- p4-clockmod seems to do it right :)
> 
> It's not as noisy, indeed. But it's not right -- as long as acpi.ko works.

It mostly does, although I've had lockups when using the /proc interface
to switch CPU frequencies -- yes, should've reported that, but I only
now remember :)

> > > I think ACPI is messing with us. It detects a high temperature
> > > situation, tries to scale down the CPU, and forces down the CPU speed.
> > 
> > Hm. This one got me thinking; I think I just found it. I forgot that I
> > installed cpufreqd a while ago, which seems to be the culprit: when I
> > start cpufreqd, the system falls back to 1925Mhz. I've removed it now,
> > however, as killing cpufreqd does not release the maximum speed back to
> > it's normal value of 2.2Ghz, I'm not entirely sure; so...
> > 
> > > Could you send me the output of /proc/acpi/processor/*/* and
> > > /proc/acpi/thermal_zone/*/* when you notice this situation again?
> > 
> > ... I've still put those at
> > http://users.pandora.be/wouter.verhelst/proc-acpi.tgz
> 
> Hm, can't recognize anything strange there. When the situation appears
> again, what does /sys/devices/sytem/cpu/cpu0/cpufreq/scaling_max_freq say?

That does not change.

-- 
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.
