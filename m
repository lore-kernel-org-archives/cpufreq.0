From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Sun, 6 Jul 2003 03:21:14 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030706012114.GW7796@poupinou.org>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr>
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
To: Juliusz Chroboczek <jch@pps.jussieu.fr>
Cc: cpufreq@www.linux.org.uk, davej@suse.de

On Sun, Jul 06, 2003 at 03:00:35AM +0200, Juliusz Chroboczek wrote:
> Running stock 2.5.73 (ACPI + preempt) on a Compaq Presario 711, CPU is
> a 950MHz mobile Duron.  I'm getting unexpected timings when enabling
> cpufreq.
> 
> On a kernel compiled without cpufreq, a CPU bound program (repeated
> sieve within L1 cache) gives the following, which is consistent with
> what I get under 2.4.18:
> 
>   real    0m1.729s
>   user    0m1.725s
>   sys     0m0.003s
> 

There is a little bug in powernow-k7.c

ducrot@neptune $  cvs diff -u -r1.42 powernow-k7.c
Index: powernow-k7.c
===================================================================
RCS file: /mnt/src/cvsroot/cpufreq/linux/arch/i386/kernel/cpufreq/powernow-k7.c,v
retrieving revision 1.42
retrieving revision 1.43
diff -u -r1.42 -r1.43
--- powernow-k7.c	16 Jun 2003 20:39:11 -0000	1.42
+++ powernow-k7.c	4 Jul 2003 15:18:55 -0000	1.43
@@ -1,5 +1,5 @@
 /*
- *  $Id: powernow-k7.c,v 1.42 2003/06/16 20:39:11 davej Exp $
+ *  $Id: powernow-k7.c,v 1.43 2003/07/04 15:18:55 ducrot Exp $
  *
  *  (C) 2003 Dave Jones <davej@suse.de>
  *
@@ -268,8 +268,8 @@
 		change_VID(vid);
 	} else {
 		/* Going up, so change VID first */
-		change_VID(fid);
-		change_FID(vid);
+		change_VID(vid);
+		change_FID(fid);
 	}
 	
 


It is not in mainline AFAIK.

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
