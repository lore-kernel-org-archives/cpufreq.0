From: Len Brown <len.brown@intel.com>
Subject: RE: Athlon 64 complains of frequency mismatch
Date: 23 Jun 2004 13:52:55 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1088013174.4319.302.camel@dhcppc4>
References: <84EA05E2CA77634C82730353CBE3A8432698C4@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <84EA05E2CA77634C82730353CBE3A8432698C4@SAUSEXMB1.amd.com>
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
To: paul.devriendt@amd.com, Marc Singer <elf@buici.com>
Cc: linux@dominikbrodowski.de, "cpufreq@www.linux.org.uk" <cpufreq@www.linux.org.uk>

On Wed, 2004-06-23 at 03:43, paul.devriendt@amd.com wrote:
> I am of the opinion that this is a bug in the ACPI subsystem.
> The BIOS developers find it easy to always have the space
> allocated for their tables. They "hide" them by tricks
> such as changing _PSS to XPSS.

Feel free to file an ACPI bug here and I'll be happy to look into it:
http://bugzilla.kernel.org/enter_bug.cgi?product=ACPI
Component: power-processor

It should describe the behaviour of the two configurations
A. Cool&Quiet enabled in BIOS
B. Cool & Quiet disabled in BIOS
and what is unexpected.

It should include the output from acpidmp taken in each configuration.
acpidmp is available in /usr/sbin/, or in pmtools:
http://ftp.kernel.org/pub/linux/kernel/people/lenb/acpi/utils/

Only with this can we tell what curve ball the BIOS is throwing.

thanks,
-Len
