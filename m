From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: ondemand governor
Date: Fri, 24 Sep 2004 22:53:02 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040924205301.GA16470@message-id.gmane0305.slipkontur.de>
References: <20040924142711.GE5746@message-id.gmane0305.slipkontur.de>
	<20040924201724.GA8299@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040924201724.GA8299@dominikbrodowski.de>
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

On Fri, Sep 24, 2004 at 10:17:24PM +0200, Dominik Brodowski wrote:
> On Fri, Sep 24, 2004 at 04:27:13PM +0200, Stefan Seyfried wrote:
> > i finally tried the ondemand governor. Short: i wasn't very impressed :-)
> > I ran it on a Dell D600 with 1700mhz pentium M (banias)
> 
> Hm. What's the latency of the system? cat /proc/acpi/processor/*/performance
> - or do you use the built-in tables?

to be honest - i have no idea. I don't have /proc/acpi/processor/*/performance
It seems it is not compiled into SUSE kernels since it's marked 'deprecated'.
dmesg doesn't show me much either, can i get this from sysfs? I only used the
stuff from userspace until now and since it worked pretty well out of the box,
i did not have a closer look until now.

strolchi:~ # /bin/ls -l /proc/acpi/processor/CPU0/
total 0
-r--r--r--  1 root root 0 Sep 24 22:44 info
-rw-r--r--  1 root root 0 Sep 24 22:44 limit
-r--r--r--  1 root root 0 Sep 24 22:44 power
-rw-r--r--  1 root root 0 Sep 24 22:44 throttling

> > The problem was: it always switched to the higher frequencies, even if the 
> > system was mostly idle (~5-10%). gkrellm (there is a nice cpufreq plugin for
> > it...) showed me that the switchup often occured when accessing the disk
> > (reiserfs / flushing buffers every 5 seconds).
> 
> hm. AFAICS, the wait for disk ticks aren't considered to be "idle ticks"
> though they are...

also it may be a good idea to provide an option to consider "nice" processes
as idle.

> > If i get some time (not in the next two weeks...) i will take a look at
> > incorporating the algorithms we have put into powersaved into the ondemand
> > governor.
 
> Better write another governor, copy the code you need from ondemand, and
> (re-)write other parts differently.

Yes, that's what i had in mind. One "small, simple, fast" and one "fat and
bloated with options" :-)
-- 
Stefan Seyfried
