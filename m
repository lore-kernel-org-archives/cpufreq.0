From: Dominik Brodowski <linux@brodo.de>
Subject: Re: 2.6.0-test1 CpuFreq Speedstep Quirks
Date: Fri, 18 Jul 2003 08:16:41 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030718061641.GA1882@brodo.de>
References: <20030717144842.70a5d7b3.vaio@nolatency.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="W/nzBZO5zC0uMSeA"
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030717144842.70a5d7b3.vaio@nolatency.com>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
To: Michael Vallaly <vaio@nolatency.com>
Cc: cpufreq@www.linux.org.uk


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

Many thanks for your extensive bug report. Could you please try out the
following:

a) test the attached patch

b) if this didn't help, boot with "clock=pit"

	Dominik


On Thu, Jul 17, 2003 at 02:48:42PM +0000, Michael Vallaly wrote:
> 
> 
> Hello, 
> 
> After testing the 2.6.0-test1 kernel with CPUfreq scaling compiled in (+userspace govenor) I have noticed some changes in the way the kernel detects and prints my CPU information. Along these lines some programs (in peticular, mplayer and xmms) have some issues syncing (apparently time critical / cpu speed critical code.) As of right now these issues only seem to disappear if I run in powersave mode. Im not quite sure if this is a bug or not as I am quite new to cpu frequency scaling issues. If this is no
> t a bug / problem maybe someone can help enlighten me as to what is actually occuring. I would be willing to test anything speedstep / cpufreq related as I have quite a bit of freetime until August 25th. Attached are few screenshots of the interesting quirks with Cpufreq installed. Thanks for you time..
> 
> - Mike
> 
> 
> Michael Vallaly
> vaio@nolatency.com
> 
> 
> 



--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="cpufreq-2.6.0-test1-speedstep-fix_setspeed"

Correct the notification of the cpufreq core of the new frequency being 
set in ich's speedstep_set, and print accurate debug info in this function.
(both bugs noted by Valdis Kletnieks, thanks!)

 arch/i386/kernel/cpu/cpufreq/speedstep-ich.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

--- linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c.original	2003-07-14 23:26:42.415960752 +0200
+++ linux/arch/i386/kernel/cpu/cpufreq/speedstep-ich.c	2003-07-14 23:29:42.624564880 +0200
@@ -82,7 +82,7 @@
 		return;
 
 	freqs.old = speedstep_get_processor_frequency(speedstep_processor);
-	freqs.new = speedstep_freqs[SPEEDSTEP_LOW].frequency;
+	freqs.new = speedstep_freqs[state].frequency;
 	freqs.cpu = 0; /* speedstep.c is UP only driver */
 	
 	if (notify)
@@ -137,7 +137,7 @@
 	dprintk(KERN_DEBUG "cpufreq: read at pmbase 0x%x + 0x50 returned 0x%x\n", pmbase, value);
 
 	if (state == (value & 0x1)) {
-		dprintk (KERN_INFO "cpufreq: change to %u MHz succeeded\n", (freqs.new / 1000));
+		dprintk (KERN_INFO "cpufreq: change to %u MHz succeeded\n", (speedstep_get_processor_frequency(speedstep_processor) / 1000));
 	} else {
 		printk (KERN_ERR "cpufreq: change failed - I/O error\n");
 	}

--W/nzBZO5zC0uMSeA--
