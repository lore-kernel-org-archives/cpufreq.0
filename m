From: Brian Pritchard <brian@69centhosting.com>
Subject: powernow-k7 patch
Date: Mon, 10 Mar 2003 19:49:43 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <5.2.0.9.0.20030310194728.0be7e440@69centhosting.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi all,
Just a quick question; the patch for broken PST tables available here 
http://www.poupinou.org/cpufreq/powernow-k7/ will only take a fsb speed of 
100 or 133
+       /* Validate fsb... */
+       if (new_fsb != 100 && new_fsb != 133)
+               return -EINVAL;
I have a fsb speed of 266, can I safely use this code anyway, or is there a 
reason it only takes those two values?  Also I have previously been looking 
at a patch from here http://www.nervous.it/hw/patch-cpufreq-PST.gz which is 
much simpler, could I use this with a fsb of 266? looks like:
+       *((u32*)fake_pst) = 0x780;   /* cpuid */
+       *(fake_pst+4) = 133; /* fsbspeed */
+       *(fake_pst+5) = 1;   /* maxfid (11.5) */
+       *(fake_pst+6) = 23;  /* startvid (1.1) */
+       *(fake_pst+7) = 5;   /* numpstates */
+
+       *(fake_pst+8) = 4;   /*  666 MHz */
+       *(fake_pst+9) = 23;  /*  1.1 V   */
Any advice would be great,
thank you
brian
