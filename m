From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: TM5800 and longrun
Date: Tue, 20 Apr 2004 21:04:35 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040420190435.GA7930@dominikbrodowski.de>
References: <PLEKLEBDHEEMEIKIDEGNCEEGCAAA.dflogera@halifax.mda.ca>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <PLEKLEBDHEEMEIKIDEGNCEEGCAAA.dflogera@halifax.mda.ca>
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
Content-Transfer-Encoding: 7bit
To: David Flogeras <dflogera@iotek.ns.ca>
Cc: cpufreq@www.linux.org.uk

On Tue, Apr 20, 2004 at 01:54:22PM -0300, David Flogeras wrote:
> Hi,
> 
> I am running a 2.4.25 kernel, patched with acpi from acpi.sf.net, and
> cpufreq-LINUX_2_4-20040420.tar.bz2.  The system is a single board PC, with a
> Transmeta Crusoe (TM5800) chip.
> 
> I have compiled the kernel with cpufreq support, and longrun is built as a
> module.
> 
> When I insmod longrun, I get no messages on the terminal, nor in dmesg.
> 
> If I look in /proc/sys/cpu/0 (no sysfs on this system) I have three files,
> speed, speed-min, and speed-max.  cat'ing shows that each contains a single
> character '0'.
That's no surprise - these files only make sense for CPUs which are set to a
frequency. Longrun-capable CPUs are set to a frequency range, and the CPU
itself decides at which speed it should run.

> I am at a loss, what should I do to debug this?

What does /proc/cpufreq say?

	Dominik
