From: Len Brown <len.brown@intel.com>
Subject: Re: [PATCH] cpufreq_ondemand
Date: 20 Oct 2004 17:03:45 -0400
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <1098306225.26605.4345.camel@d845pe>
References: <7f800d9f04101922031be5cfe8@mail.gmail.com>
	<1098257735.26595.4308.camel@d845pe>
	<20041020143057.GA7652@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041020143057.GA7652@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: Andre Eisenbach <int2str@gmail.com>, Alexander Clouter <alex-kernel@digriz.org.uk>, linux-kernel@vger.kernel.org, Con Kolivas <kernel@kolivas.org>, "cpufreq@www.linux.org.uk" <cpufreq@www.linux.org.uk>

On Wed, 2004-10-20 at 10:30, Dominik Brodowski wrote:
> On Wed, Oct 20, 2004 at 03:35:35AM -0400, Len Brown wrote:

> > The question is what POLICY we're trying to implement.
> 
> This is why there may be DIFFERENT policies a.k.a. governors in
> cpufreq.
....
> 
> Put it in userspace, and let it ask the cpufreq core in the kernel to
> use a specific governor or another depending on what you want. That's
> what certain userspace daemons / scripts already do, btw.

Processors are not the only devices with power management.  When a
device driver, say USB, or any ACPI or PCI power-managed device,
recognizes that its device is idle, who does it ask to find out what
power state to put the hardware in?  Today there is nobody to tell it
what to do.

The user's global desired power policy needs to be represented in the
kernel where all devices can get at it so they can make low-latency
policy-based decisions.  It isn't clear that the cpufreq multiple
governor implementation model would work well for the system as whole.

-Len
