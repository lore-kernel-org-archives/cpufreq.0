From: Wouter Verhelst <wouter@grep.be>
Subject: Re: p4-clockmod doesn't seem to allow the highest possible speed
Date: Sat, 10 Jan 2004 17:32:12 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040110163212.GD10531@grep.be>
References: <20040109181851.GA1393@grep.be>
	<20040110101534.GA10003@dominikbrodowski.de>
	<20040110110800.GA8294@grep.be>
	<20040110131824.GA5010@dominikbrodowski.de>
	<20040110152145.GA10160@grep.be>
	<20040110154110.GA8735@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040110154110.GA8735@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Sat, Jan 10, 2004 at 04:41:10PM +0100, Dominik Brodowski wrote:
> On Sat, Jan 10, 2004 at 04:21:45PM +0100, Wouter Verhelst wrote:
> > On Sat, Jan 10, 2004 at 02:18:24PM +0100, Dominik Brodowski wrote:
> > > On Sat, Jan 10, 2004 at 12:08:00PM +0100, Wouter Verhelst wrote:
> > > > Vanilla 2.6.1, but I had the same problem with 2.6.0 (didn't try
> > > > p4-clockmod on any kernel before that).
> > > 
> > > You shouldn't need to use p4-clockmod at all... speedstep-ich is a better
> > > choice for your system...
> > 
> > This doesn't seem to work, it says 'No such device'. I have a VIA 82C686
> > south bridge, not an Intel one, so I guess that's the reason.
> 
> Unfortunately, you're right. VIA doesn't publish their spec sheets as Intel
> does, so there's no speedstep-via driver (yet). Maybe acpi.ko works?

It does, but when my CPU is throttled, it makes an uncomfortable sound
at high frequency, so I try to avoid that.

-- 
Wouter Verhelst
Debian GNU/Linux -- http://www.debian.org
Nederlandstalige Linux-documentatie -- http://nl.linux.org
"Stop breathing down my neck." "My breathing is merely a simulation."
"So is my neck, stop it anyway!"
  -- Voyager's EMH versus the Prometheus' EMH, stardate 51462.
