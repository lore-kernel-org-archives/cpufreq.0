From: Drew Varner <drew.varner@redops.org>
Subject: Dealing with faulty BIOS table
Date: Sun, 18 Jan 2004 22:15:09 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1074482108.7978.232.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
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
To: cpufreq@www.linux.org.uk

Hey folks,

I have an HP pavilion (ze4502us) with broken PST tables. I'll mail the
dmidecode results directly to Dave per the instructions in kernel
messages. If anyone wants me to post them to the list, let me know and
I'll do it.

Is there a blueprint for how to deal with broken PST tables given their
prevalence? I know that the ideal solution is for vendors to ship
machines with the correct data in the BIOS. I was thinking of something
similar to the blacklist method in ACPI. I am not really sure how you'd
fingerprint a broken laptop. To identify mine as a broken machine, I'd
use logic like...

// PST tables are known broken tables of a ze4502us...
if (cpu has powernow capabilities) AND
   (no PST tables match the cpuid) AND
   (cpuid is cpuid of a ze4502us) AND
   (the # of PST tables matches the # in a ze4502us) AND
   (signature of ea. PST table matches a ze4502us)

The code could suggest (via printk) what the problem is (you have a
known broken BIOS) and could propose a fix (it probably could be fixed
by selecting one of the PSTs using a fake cpuid) during regular bootup.
Similar to ACPI, there could be a kernel parameter (like ACPI=force)
passed during the boot process to try fix broken PST tables instead of
merely suggesting the solution. Obviously "use at your own risk"
documentation would accompany the solution. 

Is this worth doing? Is this the right way to do it? I don't know if the
prevalence of broken PST files justifies adding a separate file to fix
them. However, I think many users would like rather pass a kernel
parameter to overcome their broken BIOS rather than recompile their
kernel with a one line hack. I think you'd probably want to break it out
the logic into a separate file to avoid kludge.

- Drew
