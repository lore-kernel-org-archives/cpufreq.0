From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 16:48:25 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111154825.GA14031@poupinou.org>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040110193526.GM10531@grep.be>
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

On Sat, Jan 10, 2004 at 08:35:26PM +0100, Wouter Verhelst wrote:
> On Sat, Jan 10, 2004 at 07:53:08PM +0100, Ducrot Bruno wrote:
> > On Sat, Jan 10, 2004 at 05:32:12PM +0100, Wouter Verhelst wrote:
> > > On Sat, Jan 10, 2004 at 04:41:10PM +0100, Dominik Brodowski wrote:
> > > > Unfortunately, you're right. VIA doesn't publish their spec sheets
> > > > as Intel does, so there's no speedstep-via driver (yet). Maybe
> > > > acpi.ko works?
> > > 
> > > It does, but when my CPU is throttled, it makes an uncomfortable
> > > sound at high frequency, so I try to avoid that.
> > 
> > Do you mean the processor is at high speed (performance), and throttling
> > is enabled?
> > 
> > So it should not be even surprising.
> > 
> > The P4 is able to throttle itself, so I guess the throttling
> > things done externally by the south bridge would have not even
> > been tested by the platform designer...
> 
> Uh, I'm not entirely sure I understand what you mean here. The issue is:
> when I put the processor in some other T-state than T0, it makes noise.
> That happens both when it's in P0 or P1.

A CPU have a pin which is used in order to stop execution.  By
generating a signal which toggle that pin, you throttle down a CPU.
If now the circuitry in order to generate that signal contains
some cheap capacitors, this may generate sounds.

All you do via ACPI T states is to configure a chipset (most likely
the south bridge) in order to generate the signal at a given
frequency, and T0 will disable this signal.

All P4 have the ability, though, to throttle without another hardware
circuitry.  p4-clockmod is the software interface for that feature.

In short, acpi T-state and p4-clockmod will give you the exact same
behaviour, but is done diferently, one requiring an external hardware
which seems, in your case, to contains cheap components (but that do
not matter, since you should use p4-clockmod instead of ACPI T-states
anyway).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
