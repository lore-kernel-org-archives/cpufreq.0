From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sun, 11 Jan 2004 21:24:50 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040111202450.GB25048@grep.be>
References: <20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
	<20040110163212.GD10531@grep.be>
	<20040110185308.GZ14031@poupinou.org>
	<20040110193526.GM10531@grep.be>
	<20040111173547.GB5485@dominikbrodowski.de>
	<20040111195619.GA25048@grep.be>
	<20040111200617.GA25713@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040111200617.GA25713@dominikbrodowski.de>
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

On Sun, Jan 11, 2004 at 09:06:18PM +0100, Dominik Brodowski wrote:
> On Sun, Jan 11, 2004 at 08:56:19PM +0100, Wouter Verhelst wrote:
> > It mostly does, although I've had lockups when using the /proc interface
> > to switch CPU frequencies -- yes, should've reported that, but I only
> > now remember :)
> 
> The /proc/ interface is deprecated,

Yes, I know. In fact, it being deprecated is the reason I started
playing with p4-clockmod in the first place :)

> and the acpi module is full of errors [I'm working on it, though...].
> You should use the /sys-fs interface with the acpi.ko module as well.
> 
> > That does not change.
> 
> Very strange... I'm out of ideas for the moment being.

I'm more and more convinced it's got something to do with cpufreqd. I
shut it down yesterday for about an hour, and nothing happened. Then I
restarted it, and -surprise- less than a minute later, the CPU was
throttled below the maximum speed.

-- 
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.
