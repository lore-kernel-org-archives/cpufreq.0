From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: cpufreq/linux/arch/arm/mach-sa1100 cpu-sa1100.c, 1.5,
Date: Mon, 30 Aug 2004 15:17:25 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040830131725.GA8355@dominikbrodowski.de>
References: <20040829124936.GA16770@dominikbrodowski.de>
	<20040830121923.GR29560@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040830121923.GR29560@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, rmk@arm.linux.org.uk

Hi Bruno,

On Mon, Aug 30, 2004 at 02:19:23PM +0200, Bruno Ducrot wrote:
> Well, I don't see actually your points.  IIRC arm suspend/resume is only
> available via apm, so if something goes wrong on this architecture, it's
> much more likely a trouble of the firmware.  IIRC, the only action taken
> some times ago was to set the frequency to what think the cpufreq
> infractucture in the resume path, and this was clearly to make
> arm folks happy.
> I actually was thinking all those flags were added more for the
> i386 architectures, not for arm, but I am apparently completely wrong,
> I guess..

i386 can adapt to "hidden" changes of CPU frequencies quite well now, as the
TSC code tries to detect "changes behind its back"... so these flags were
not added out of concern for the x86 architecture, but because they seemed
necessary for certain systems. Possibly I'm completely wrong, though...

Thanks,	
	Dominik
