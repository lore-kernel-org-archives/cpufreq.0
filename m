From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: inquiry
Date: Fri, 24 Oct 2003 18:46:01 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031024164601.GK28351@poupinou.org>
References: <000801c39a02$c2e670c0$dd50013d@sachinibnsk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <000801c39a02$c2e670c0$dd50013d@sachinibnsk>
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
To: Bharadwaj <sachinib_nsk@sancharnet.in>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 23, 2003 at 12:19:29PM +0530, Bharadwaj wrote:
> Sir,
> I want to change the display of the CPU frequency (If a 
> 486dx displays frequency of 66MHz can we change it to
> 100MHz.) not by overclocking but writing it permanently
> in the CPU it self.I have done this with IDT and winchip
> brand(O.E.M.for Intel) but the effect was not permanent
> after giving a cold reboot of long time the processor showed its original frequency and I want to change it to any I think.
> If you have some information please replay me

Try this patch:


--- arch/i386/kernel/cpu/proc.c	2003/10/24 16:41:47	1.1
+++ arch/i386/kernel/cpu/proc.c	2003/10/24 16:43:24
@@ -79,10 +79,13 @@
 	else
 		seq_printf(m, "stepping\t: unknown\n");
 
+#if 0
 	if ( cpu_has(c, X86_FEATURE_TSC) ) {
 		seq_printf(m, "cpu MHz\t\t: %lu.%03lu\n",
 			cpu_khz / 1000, (cpu_khz % 1000));
 	}
+#endif
+	seq_printf(m, "cpu MHz\t\t: 100.000\n");
 
 	/* Cache size */
 	if (c->x86_cache_size >= 0)


Or eventually try to be honest with your customers.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
