From: "David Flogeras" <dflogera@iotek.ns.ca>
Subject: TM5800 and longrun
Date: Tue, 20 Apr 2004 13:54:22 -0300
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <PLEKLEBDHEEMEIKIDEGNCEEGCAAA.dflogera@halifax.mda.ca>
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
To: cpufreq@www.linux.org.uk

Hi,

I am running a 2.4.25 kernel, patched with acpi from acpi.sf.net, and
cpufreq-LINUX_2_4-20040420.tar.bz2.  The system is a single board PC, with a
Transmeta Crusoe (TM5800) chip.

I have compiled the kernel with cpufreq support, and longrun is built as a
module.

When I insmod longrun, I get no messages on the terminal, nor in dmesg.

If I look in /proc/sys/cpu/0 (no sysfs on this system) I have three files,
speed, speed-min, and speed-max.  cat'ing shows that each contains a single
character '0'.

I am at a loss, what should I do to debug this?

Dave
