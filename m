From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Mon, 12 Jan 2004 13:26:13 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040112122613.GE14031@poupinou.org>
References: <20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
	<20040111173547.GB5485@dominikbrodowski.de>
	<20040111195619.GA25048@grep.be>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040111195619.GA25048@grep.be>
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
To: Wouter Verhelst <wouter@grep.be>
Cc: cpufreq@www.linux.org.uk

On Sun, Jan 11, 2004 at 08:56:19PM +0100, Wouter Verhelst wrote:
> On Sun, Jan 11, 2004 at 06:35:47PM +0100, Dominik Brodowski wrote:
> > On Sat, Jan 10, 2004 at 08:35:26PM +0100, Wouter Verhelst wrote:
> > > That happens both when it's in P0 or P1.
> > 
> > So ACPI works to set the processor in P0 and P1?
> 
> Yes.
> 
> > If so, you really really should use the ACPI cpufreq driver instead of
> > the p4-clockmod driver. The former will offer you true "SpeedStep"
> > support, the latter only some clock modulation which won't save you
> > much energy as ACPI supports the C2 idle state anyway. 
> 
> Ah, so what p4-clockmod does is not SpeedStep?
> 
> Hm. That sucks.

No.  p4-clockmod is not SpeedStep.  Normal.  As Dominik say, p4-clockmod
is *not* intended for power comsuption issues.

There is normally two reasons for slowing a CPU:

1- change voltage of processor (SpeedStep, Powernow, etc.)
   The usage for is to get more battery life, or to get less power comsuption
   for the system.

2- throttling the CPU via clock modulation (P4 only), or by generating
   a signal which toggle the STP# pin of a CPU.  The usage for it is
   to cool the CPU instead of turning on/off the CPU fan.  It is also
   used if the fan is not sufficiant to cool enough the CPU.

1 and 2 do not have the same goal.  The CPUFreq project currently only
handle case 1- (via policy, governor, etc.).  But I'm thinking about
designing case 2- for the cpufreq core (there is already something for,
but it is not exactly what I would expect), and that should rely on
lm-sensors or/and ACPI thermal.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
