From: Dave Jones <davej@redhat.com>
Subject: Re: post-OLS pending cpufreq patches
Date: Wed, 28 Jul 2004 14:59:16 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040728135916.GA6308@redhat.com>
References: <20040727205126.GB9438@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040727205126.GB9438@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Tue, Jul 27, 2004 at 10:51:26PM +0200, Dominik Brodowski wrote:

 > As KS and OLS are over, here's a status update on what patches and/or what
 > issues (in the world outside of KS and OLS) are at what state at the moment.
 > Also, I'm looking forward to read Paul's paper in the OLS proceedings, and
 > to see what Dave has added to his TODO list :)

I fly back today (should have been last night, but thats a long
story for another time), and expect to spend a few days doing
nothing work related at all when I get back 8-)

Notes I scribbled in my TODO during OLS include..

- rdmsr_on_cpu(int cpunr)
Paul mentioned this would make life easier in powernow-k8
It's low hanging fruit, as most of the implementation is
already in the msr driver. We can just generic-ise that.

- perform multiple scaling operations to 'step' to driver.
I've had some reports from k7 users that jumps from low->high
still dont work, but gradual increments work. This may also
solve the longhaul problems. k8 also could this I think.

- check permissons on cpufreq sysfs files
Someone mentioned that have these root r-- is a bit
pointless as they aren't really security sensitive.

- fill in gaps between low/high tables
Some powernow-k7 tables only have 2-3 entries in their PST's
though we know from the spec that other frequencies are available.
We could fill in these frequences, and for voltage take value from
next highest.

- no-table support for k7
Recently I've been getting more and more reports from folks putting
mobile K7's into desktop boards, which have no BIOS support
(no PST table, or ACPI P states).
For high speed, take what we booted at.
For low ?
Could be tricky.

- scheduler bits
"migrate everything off this CPU"
Useful when dropping CPU speed to very low speed/power, when
another CPU in the system is not-quite-idle.

- hotplug cpu support?
won't save any power today, but worth thinking about *now*,
as future CPUs could potentially have big savings here.

- longhaul ACPI support ?
Newer systems should support P-states.

- longhaul voltage scaling
I ripped this out long ago. Need to revisit it.


Thanks for scooping up the patches, I'll take a look at merging
them a few days after I get back, possibly the weekend, Monday
at the latest.

		Dave
