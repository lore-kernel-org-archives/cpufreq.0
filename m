From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 19:05:59 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111180559.GD14031@poupinou.org>
References: <20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
	<20040111154825.GA14031@poupinou.org>
	<20040111173003.GA5485@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040111173003.GA5485@dominikbrodowski.de>
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
To: Wouter Verhelst <wouter@grep.be>, cpufreq@www.linux.org.uk

On Sun, Jan 11, 2004 at 06:30:03PM +0100, Dominik Brodowski wrote:
> On Sun, Jan 11, 2004 at 04:48:25PM +0100, Ducrot Bruno wrote:
> > (but that do
> > not matter, since you should use p4-clockmod instead of ACPI T-states
> > anyway).
> 
> What are the advantages of p4-clockmod in favour of ACPI T-states?
> 

1- Latency (MSR access instead of ISA IO space).
2- Safety (p4-clockmod do not rely on external circuitry, or hw bugs from
   the southbridge).
3- even though I don't think p4-clockmod do not support this, it is
   possible to throttle the CPU in case of overheating issue, without
   need to do that in software.
4- a little more power efficient, since generating a signal cost power
   (but I don't think that you gain so much).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
