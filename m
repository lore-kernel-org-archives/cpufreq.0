From: Johan Braennlund <johan.brannlund@telia.com>
Subject: Re: Cpufreq hang
Date: Sun, 20 Jul 2003 22:12:30 +0200 (CEST)
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <Pine.LNX.4.53.0307202204500.5743@h192n1fls22o1048.telia.com>
References: <Pine.LNX.4.53.0307161622300.30690@h192n1fls22o1048.telia.com>
 <20030716145325.GC632@inferi.kami.home> <Pine.LNX.4.53.0307161929430.30922@h192n1fls22o1048.telia.com>
 <20030719202515.GA731@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <20030719202515.GA731@brodo.de>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@brodo.de>
Cc: cpufreq@www.linux.org.uk


Hi!

On Sat, 19 Jul 2003, Dominik Brodowski wrote:

> Can you please re-test it with 2.6.0-test1, and especially check whether the
> following works:
>
> a) loading the "userspace" governor [please modprobe it first, of course]
> cd /sys/devices/system/cpu/cpu0/cpufreq/
> echo -n "userspace" > scaling_governor

[...]

I tried the tests you suggested using 2.6.0-test1-mm1, since I had that
kernel handy and everything worked. Cpufreqd also works they way it's
supposed to now, so everything is fine. I noticed that the cpufreq
changes in -mm1 were pretty minor and probably wouldn't affect the hang I
saw, so plain -test1 is probably okay too.

> Many thanks for testing cpufreq,
> 	Dominik

I'm glad to be able to do my little part.

Regards,

Johan
