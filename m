From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: speedfreq: epia + longhaul + speedfreq + copying large files =
	freeze
Date: Wed, 22 Dec 2004 11:02:39 -0800
Message-ID: <1103742159.16413.24.camel@localhost>
References: <41C83AA7.6010204@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <41C83AA7.6010204@gmx.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Sebastian <sebastian_ml@gmx.net>
Cc: cpufreq list <cpufreq@www.linux.org.uk>

On Tue, 2004-12-21 at 16:00 +0100, Sebastian wrote:
> Dear Jeremy,
> 
> thanks for your tool! I like it best of all cpufreq daemons,

Thanks!

This problem sounds like a bug in the longhaul driver though, which I
don't really know anything about.  (The system should never crash,
regardless of what speedfreqd does.)  

I've cc:d the cpufreq list to see if someone there can help.  Dave?

	J

> Anyway, the Epia board normally runs fine with speedfreq. Frequency gets
> adjusted between 400Mhz and 600MHz. But when I start cutting
> advertisements out of the DVB recordings with the VDR software (Video
> Disk Recorder from Klaus Schmiedinger, www.cadsoft.de/vdr) after a short
> while it freezes.  The cutting process is simply like copying large
> files from one folder to another folder on the same partition. Mostly
> 1.7 to 2.7GB. I tried the following:
> 
> 1. Cutting a recording, cpufreq enabled, speedfreq daemon running:
> 
> System freeze.
> 
> 2. Copying large files manually, cpufreq enabled, speedfreq daemon running:
> 
> System freeze.
> 
> 3. Cutting a recording, cpufreq enabled, speedfreq daemon disabled:
> 
> Works.
> 
> 4. Copying large files manually, cpufreq enabled, speedfreq daemon disabled:
> 
> Works.
> 
> I'd like to add that sometimes I get messages in syslog telling me that
> speedfreq thought the actual frequency was xxx and discovered that the
> real frequency was something else. Once that was the last thing in
> syslog before a freeze. I don't know if this is relevant, because 99% of
> the freezes the syslog stays like it is, nothing gets added.
> 
> The kernel is a vanilla 2.6.9. The Linux Distribution is Gentoo stable. 
> Flags are "-O2 -march=c3 -fomit-frame-pointer -mmmx -m3dnow -pipe". I 
> have no 4k stacks, no preemption, no nptl, no perl ithreads.
> 
> Maybe speedfreq changing frequencies too fast for the little Epia is the 
> reason for the freezes? What can I do?
