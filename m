From: paul.devriendt@amd.com
Subject: RE: Athlon 64 complains of frequency mismatch
Date: Tue, 22 Jun 2004 08:26:38 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8431990F7@SAUSEXMB1.amd.com>
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
To: elf@buici.com
Cc: cpufreq@www.linux.org.uk

> Perhaps I'm missing something.  If AMD advertizes Cool&Quiet as does
> this vendor, MSI, then there has to be someplace where this data is
> given to Windows.  Are we talking about the vendor providing a Windows
> driver without including the necessary information in the BIOS?

The Windows XP driver gets the information from the same place as
the Linux driver ... the ACPI _PSS object.

If Windows is able to find the data but Linux can not, then we have
some sort of bug or spec compliance issue.

Windows 2000 gets the information from the BIOS PSB table, and the
Linux driver is also capable of using this data (if CONFIG_ACPI_PROCESSOR
is not set, or if ACPI _PSS data can not be found).

Paul.
