From: paul.devriendt@amd.com
Subject: RE: powernow-k8 won't load on Athlon64
Date: Mon, 23 Aug 2004 11:55:41 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8439912EB@SAUSEXMB1.amd.com>
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
To: ducrot@poupinou.org, ajp@aripollak.com
Cc: cpufreq@www.linux.org.uk

> Here, the powernow-k8 driver complains there is too many low
> frequencies.  This come from ACPI stuff in powernow-k8.

The AMD driver does not allow you to have multiple low
frequencies. The complication is that the hardware can not
transition from a low frequency (<=1.4GHz) to another low
frequency - it has to switch to a high frequency (>=1.6GHz)
as an interim step.

It would be a trivial hack to change the driver to ignore
such multiple entries instead of giving a fatal error. It
already ignores bogus entries of -1 so that code path is 
there.

I thought I saw a post from Pavel that he had a modified version
of the driver that did implement low-low transition.

> > powernow-k8: BIOS error: PSB table is not v1.4
> 
> Here, after falling back to the PSB/PST method, it complain about the
> wrong version of the PSB table.
> 
> There is very likely a BIOS trouble, though I would expected that this
> work after a patch from Paul?  

From previous such problems I have looked at, the BIOS writers left
the old K7 tables in the BIOS when they implemented the K8 support.
That may or may not be the case here. I suggest the best way forward
is to ignore this (or report it to the machine vendor as a broken
BIOS) and get the ACPI stuff working.

Paul.
