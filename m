From: Dominik Brodowski <linux@brodo.de>
Subject: [RFC] split up cpufreq.c in several files, x86 autoloader
Date: Sat, 4 Oct 2003 00:36:12 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031003223612.GA18181@brodo.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

I've a patch ready which splits up drivers/cpufreq/cpufreq.c into several
files. Instead of

-rw-r--r--    1 linux    users       26014 2003-10-03 23:31 cpufreq.c

it's this:

-rw-r--r--    1 linux    users       11625 2003-10-04 00:17 cpufreq_core.c
	driver and device {un}registration. Can be split up further if
	there's need to do so

-rw-r--r--    1 linux    users        2832 2003-10-04 00:10 cpufreq_governor.c
	cpufreq_governor and friends, and governor {un}registration

-rw-r--r--    1 linux    users        1221 2003-10-04 00:19 cpufreq.h
	prototypes for shared variables and functions

-rw-r--r--    1 linux    users        4913 2003-10-04 00:13 cpufreq_notifiers.c
	cpufreq notifier lists

-rw-r--r--    1 linux    users        7576 2003-10-04 00:14 cpufreq_sysfs.c
	cpufreq sysfs and kobject handling



What's the general opinion about such a split-up?

And what does the public think about this:
Except for a small part [cpufreq_notifiers.c] the rest of the cpufreq core
could be built as a module. drivers/acpi/processor.ko would depend on it,
though [until my ACPI patches are accepted, at least], and it couldn't be
available for a certain ARM architecture IIRC. For x86, it'd make life,
testing, and developing easier.


Third, and last question:
For x86 there is a wide choice of cpufreq drivers. Especially for
distributions and inexperienced users [no pun intended] it might become more
and more difficult to select the best driver: "I got a mobile Pentium-4-M,
p4-clockmod or speedstep-ich?" is one good example. Should the detection of
the "best" cpufreq driver be made available as an optional(!)
"cpufreq-autoload" module in arch/i386/kernel/cpu/cpufreq/?

	Dominik
