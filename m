From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: 2.4 patch and powernow-k8
Date: Tue, 14 Dec 2004 13:00:12 +0100
Message-ID: <20041214120012.GD2140@poupinou.org>
References: <41AF938B.4080204@danhartman.org>
	<20041203090955.GC9288@dominikbrodowski.de>
	<41B0D199.9000309@danhartman.org>
	<20041213133224.GA2140@poupinou.org>
	<41BDE6AA.3050004@danhartman.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41BDE6AA.3050004@danhartman.org>
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

On Mon, Dec 13, 2004 at 10:59:54AM -0800, omv wrote:
> One other bit I had to hack - my CPUID_XFAM_MOD was coming up 0xfc0 
> (instead of 0xf40/0xf50) , so added in an extra recognition code. 
> 

Indeed.  But there is a need though to backport the generic ACPI API for
the processor performance for the 2.4 kernel before I make more stuff
for powernow-k8.  That's way, it will be much more easy to backport
the powernow-k8 driver from 2.6, and then the 2.4 version will support
more processors.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
