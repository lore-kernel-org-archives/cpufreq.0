From: Simon Cooper <thecoop@runbox.com>
Subject: Re: cpufreq segfaults when network cable plugged in
Date: Mon, 12 Apr 2004 19:00:24 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040412190024.6b78f3b9.thecoop@runbox.com>
References: <20040412004335.5995e422.thecoop@runbox.com>
	<20040412083058.GB7785@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040412083058.GB7785@dominikbrodowski.de>
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

On Mon, 12 Apr 2004 10:30:58 +0200
Dominik Brodowski <linux@dominikbrodowski.de> wrote:

> On Mon, Apr 12, 2004 at 12:43:35AM +0100, Simon Cooper wrote:
> > right, this is very strange, cpufreq (compiled into the kernel) segfaults
> > whenever the network cable on my laptop is plugged in on bootup but boots
> > ok when it is plugged in after the kernel has loaded. i can post the entire
> > segfault msg but it'll need me to write it all down. driver is 'r8139'
> > (1000Mbps card), kernel version 2.6.5-mm2
> 
> Hm, this is really very strange. 
> 
> Which cpufreq drivers do you use / are compiled into the kernel?
> What are the last two to four functions called, where's the EIP at
> the segfault? [the first few function names mentioned in the oops]
> 
> Thanks,
> 	Dominik
> 

well, technically its a kernel oops (attempted ot kill init). powersave and performance govenors are compiled in, using p4_clockmod driver. Sometimes it boots fine with the cable in, but it oops's most of the time:

Unable to handle kernel NULL pointer dereference at virtual address 00000018
...
EIP: 0060:[<c02f7c45>]  Not tainted VLI
EIP is at cpufreq_notify_transition+0x79/0x98
...
Call trace:
[<c010f543>] cpufreq_p4_setdc+0x1eb/0x306
[<c01706d3>] d_lookup+0x29/0x52
[<c010f6bb>] cpufreq_p4_target+0x5d/0x69
[<c02f757d>] __cpufreq_driver_target+0x22/0x26
...

Simon
