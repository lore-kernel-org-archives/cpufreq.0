From: paul.devriendt@amd.com
Subject: RE: bad ACPI tables for Dothan?
Date: Tue, 27 Jul 2004 19:59:23 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8433F6F22@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: jeremy@goop.org, frederikreiss@gmx.de
Cc: cpufreq@www.linux.org.uk

> In theory the ACPI tables should work fine for this Dothan, but they
> seem corrupt.  It seems that centrino_cpu_init_acpi() is getting a
> 0xffff control register value, and a corresponding 25GHz CPU 
> core speed.
> I'm assuming there's someone who knows what this means.

I do not *know* the answer, but can offer a comment based on 
looking at some ACPI tables for AMD processors. I have seen
some ACPI BIOSs where -1 in an entry seems to mean not valid.
I.e., instead of telling you there are 4 entries and giving
you 4 valid sets of data, you get 5 entries of which 1 is filled
with -1. I added code to the AMD Athlon64 driver to just ignore
anything that was filled with -1.

Paul.
