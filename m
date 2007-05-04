From: Chris Pemberton <cjpembo@gmail.com>
Subject: Use proc or sysfs with cpufrequtils
Date: Thu, 03 May 2007 21:31:52 -0500
Message-ID: <463A9B18.9020200@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hello,

I'm compiling cpufrequtils from scratch.  My kernel contains ACPI/proc 
support only (not ACPI/sysfs).

1.  Why does the kernel state that ACPI/sysfs depreciated while 
cpufrequtils states that ACPI/proc is depreciated?

2.  Can you enable both ACPI/sysfs and ACPI/proc in the kernel without 
any issues?

3.  Does this list have a searchable webpage?

Thanks,

Chris
