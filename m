From: Mattia Dongili <malattia@linux.it>
Subject: Re: Use proc or sysfs with cpufrequtils
Date: Fri, 4 May 2007 22:41:48 +0900
Message-ID: <20070504134148.GA4241@inferi.kami.home>
References: <463A9B18.9020200@gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <463A9B18.9020200@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Pemberton <cjpembo@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, May 03, 2007 at 09:31:52PM -0500, Chris Pemberton wrote:
> Hello,
> 
> I'm compiling cpufrequtils from scratch.  My kernel contains ACPI/proc 
> support only (not ACPI/sysfs).
> 
> 1.  Why does the kernel state that ACPI/sysfs depreciated while 
> cpufrequtils states that ACPI/proc is depreciated?

the cpufreq stuff has little to do with /proc/acpi. From cpufreq POW the
deprecated stuff is /proc/cpufreq while the way to go is
/sys/devices/system/cpu/cpuN/cpufreq/
That's all

> 
> 2.  Can you enable both ACPI/sysfs and ACPI/proc in the kernel without 
> any issues?
> 
> 3.  Does this list have a searchable webpage?

I don't think so.

cheers
-- 
mattia
:wq!
