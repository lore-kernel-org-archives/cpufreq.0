From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: 2.4 patch and powernow-k8
Date: Mon, 13 Dec 2004 14:32:24 +0100
Message-ID: <20041213133224.GA2140@poupinou.org>
References: <41AF938B.4080204@danhartman.org>
	<20041203090955.GC9288@dominikbrodowski.de>
	<41B0D199.9000309@danhartman.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41B0D199.9000309@danhartman.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omv <omv@danhartman.org>
Cc: cpufreq@www.linux.org.uk

On Fri, Dec 03, 2004 at 12:50:33PM -0800, omv wrote:
> My version (from CVS on sunday, i think)  looked a bit different - the 
> first block didn't have the __devexit at all, and the second was static 
> int __exit drc_cpu_exit.   I modified the second block to remove the _exit.

It's a bit old.  I have to backport the acpilib stuff first.

> 
> That appeared to do the trick - built fine.  It now looks like
> 
> static int drv_cpu_exit (struct cpufreq_policy *pol)

Commited.  Thanks.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
