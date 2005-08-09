From: Todd Poynor <tpoynor@mvista.com>
Subject: PowerOP 0/3: System power operating point management API
Date: Mon, 8 Aug 2005 20:00:00 -0700
Message-ID: <20050809030000.GA25112@slurryseal.ddns.mvista.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

[apologies for version with obsolete list address sent previously]

PowerOP is a system power parameter management API submitted for
discussion.  PowerOP writes and reads power "operating points",
comprised of arbitrary integer-valued values, called power parameters,
that correspond to registers, clocks, dividers, voltage regulators,
etc. that may be modified to set a basic power/performance point for the
system.  The core basically passes an array of integer-valued power
parameters (with very little additional structure imposed by the core)
to a platform-specific backend that interprets those values and makes
the requested adjustments.  PowerOP is intended to leave all power
policy decisions to higher layers.  An optional sysfs representation of
power parameters is also available, primarily for diagnostic use.

PowerOP can be thought of as a layer below cpufreq that actually
accesses the hardware to make cpu frequency, voltage, core bus, and
perhaps other modifications to set a power point, leaving cpufreq to
manage the interfaces based around the "cpu frequency" abstraction, the
policies and governors that select the frequency, its notifiers, and so
forth.  An example hooking up support for one cpufreq platform to
PowerOP is in patch 3/3.

Depending on the ability of the hardware to make software-controlled
power/performance adjustments, this may be useful to select custom
voltages, bus speeds, etc. in desktop/server systems.  Various embedded
systems have several parameters that can be set.  For example, an XScale
PXA27x could be considered to have six basic power parameters (mainly
cpu run mode and memory and bus dividers) that for the most part should
be set in tandem to known good sets of values as validated by the
silicon vendor, plus other parameters possible for disabling PLLs during
low-speed execution, and so forth.  PowerOP is aimed at supporting this
kind of system, where the cpu frequency abstraction specifies only part
of the operating point that may be managed from software.  It also
pushes the hardware-level power parameter management down to a level
that can be shared with other power management policy frameworks, in use
in some embedded systems, that wish to deal with entire operating points
as the basic unit of system power management..

There are many ways to tackle those issues, of course, and a new API
layer is arguably rather heavyweight.  This is one suggested way that
tries to minimize disturbing existing power management code.  Comments
very much appreciated.

Patch 2/3 is a desktop-oriented example of PowerOP; embedded examples
will follow soon.
