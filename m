From: Dave Jones <davej@redhat.com>
Subject: Re: When exactly should I worry?
Date: Sat, 4 Sep 2004 03:05:51 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040904020551.GC26517@redhat.com>
References: <E1C3FYD-0005fc-EX@www.linux.org.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1C3FYD-0005fc-EX@www.linux.org.uk>
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
To: Bryce as root <root@www.linux.org.uk>
Cc: cpufreq@www.linux.org.uk, Russell King <rmk@www.linux.org.uk>

On Fri, Sep 03, 2004 at 04:00:29PM +0100, Bryce as root wrote:
 > 
 > 
 > Linux ZenIV.linux.org.uk 2.6.7-1.494.2.2smp #1 SMP Tue Aug 3 09:59:49 EDT 2004 i686 i686 i386 GNU/Linux
 > 
 > 
 > My system logs are filled with 
 > "Losing some ticks... checking if CPU frequency changed."
 > 
 > prior to this (~15 days), there was none of this in the logs
 > 
 > Kernel messages that might be of relevance. (in no real order)
 > Using tsc for high-res timesource
 > CPU0: Thermal monitoring enabled
 > CPU1: Thermal monitoring enabled
 > ENABLING IO-APIC IRQs
 > init IO_APIC IRQs
 >  IO-APIC (apicid-pin) 2-0, 2-16, 2-17, 2-18, 2-19, 2-20, 2-21, 2-22, 2-23 not co
 > nnected.
 > ..TIMER: vector=0x31 pin1=2 pin2=-1
 > Using local APIC timer interrupts.
 > calibrating APIC timer ...
 > ..... CPU clock speed is 3014.0031 MHz.
 > ..... host bus clock speed is 200.0935 MHz.
 > checking TSC synchronization across 2 CPUs: passed.
 > Brought up 2 CPUs
 > 
 > There are no kernel messages ahout HPET or PIT.
 > lmsensors seem to indicate the CPU is stable at 41degC

Duh, 3GHz SMP, I doubt very much its a VIA c3, ignore last email. 8-)
I'll change my guess to dual P4.  I'm surprised that any of the
cpufreq drivers do anything on desktop p4's (other than p4-clockmod
which still does comparatively little).  My cloudy 'not quite
firing on all cylinders at 3am' memory is recalling some patches that
would prevent triggering these messages not so long ago, but I'm
fairly certain they should've been in that Fedora kernel you're running.
Most odd.

Can you paste the whole dmesg please?

		Dave
