From: Dominik Brodowski <linux@brodo.de>
Subject: Re: SMP status?
Date: Tue, 22 Jul 2003 14:04:22 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030722120422.GC1160@brodo.de>
References: <Pine.LNX.4.44.0307210100390.18644-100000@pianoman.cluster.toy>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0307210100390.18644-100000@pianoman.cluster.toy>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: John Clemens <john@deater.net>
Cc: cpufreq@www.linux.org.uk

On Mon, Jul 21, 2003 at 01:06:05AM -0400, John Clemens wrote:
> 
> Out of curiousity, has anyone thought about what it would take get SMP
> support into cpufreq?  I'm thinking about servers...

It's already done. The generic cpufreq core is perfectly SMP-capable, the 
x86 timing updates [in arch/i386/kernel/timers/timer_tsc.c] is 
SMP-capable, the /proc/sys/, /proc and /sys/devices interfaces are
SMP-capable. However, it's more a question of which CPUs support frequency
and voltage scaling. There's no "speedstep" for server-grade processors yet,
though AMD is reportedly thinking of including PowerNow in future releases
of their AMD64 processors. So, on x86 only the throttling-driver 
"p4-clockmod" does provide SMP [and Hyperthreading!] support.

On other architectures cpufreq + SMP is more widely available, e.g. on
sparc64.

> how big of a rats nest is this, as bad as i think it is?

It seems to work :-)

	Dominik
