From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH][DOCUMENTATION BUGFIX] latency in micro-, not nanoseconds
Date: Mon, 10 Nov 2003 17:22:46 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031110172246.GT10144@redhat.com>
References: <20031104160816.GA9187@brodo.de>
	<20031110163209.GP10144@redhat.com>
	<20031110171533.GS21970@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20031110171533.GS21970@poupinou.org>
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
To: Ducrot Bruno <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk, Dominik Brodowski <linux@brodo.de>

On Mon, Nov 10, 2003 at 06:15:33PM +0100, Ducrot Bruno wrote:

 > > The 'latency' we read from the BIOS is in microseconds, but the hardware
 > > wants it in units of 10ns. We do the necessary maths, and everything is fine.
 > > But we're also storing that result in ..
 > > 
 > > 	policy->cpuinfo.transition_latency = latency;
 > > 
 > > Which is possibly not the right thing to be doing.
 > > I think we want to be storing the 'pre 10ns munging' value here correct?
 > > 
 > 
 > Well, maybe we have to double it as well (there is actually 2 steps, the
 > VID change and the FID change, each having 'latency' 1e(-8) second)...
 > 
 > something like:
 > 	policy->cpuinfo.transition_latency = latency / 50;

Actually, I'm wondering why we need this at all anyway..

		Dave
