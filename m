From: Dave Jones <davej@redhat.com>
Subject: Re: Patch to stop i386 longhaul from deadlocking the kernel
Date: Thu, 20 Nov 2003 12:46:13 +0000
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20031120124613.GA12049@redhat.com>
References: <1068045570.23318.34.camel@ashley>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1068045570.23318.34.camel@ashley>
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
To: Ashley Pittman <ashley@quadrics.com>
Cc: cpufreq <cpufreq@www.linux.org.uk>

On Wed, Nov 05, 2003 at 03:19:30PM +0000, Ashley Pittman wrote:

 > This patch stops the deadlock in the case where the speed of the fsb is
 > undetected.  I've also made the guess function more vague so it can
 > detect the correct speed for my cpu, it might need to be even more vague
 > for other cpu's.

0xbf seems bizarre. Something went wrong somewhere.
Can you put some printk's in there, so I can see what values _guess()
and guess_fsb() are being called with ?

 > I am still unable to change the CPU speed even with this patch however. 

You're not the first report I've had of this. I'm not sure what I broke.
It was a case of 'fix for some, break others'.

 > longhaul: VIA C3 'Ezra' [C5C] CPU detected. Longhaul v1 supported.
 > longhaul: MinMult=3.0x MaxMult=6.0x
 > longhaul: FSB: 0MHz Lowestspeed=0MHz Highestspeed=0MHz
 > 
 > At this point the whole system would lock solid.

Why it locks up is also odd.

		Dave
