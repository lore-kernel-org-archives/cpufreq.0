From: visyz@visyz.net
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 15:47:13 -0500
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129204713.GB7866@visyz.net>
References: <20040129051600.GA6087@visyz.net>
	<20040129092604.GB5591@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040129092604.GB5591@dominikbrodowski.de>
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

From Dominik Brodowski on Thu, Jan 29, 2004 at 10:26:04AM +0100:
> There is no SpeedStep-capable mobile Pentium III with a core frequency of 450 MHz.
> The "lowest" SpeedStep-capable is a 500MHz variant. See Intel Document
> 245306, revision 43, page 14.

HP Omnibook model number f1662wt. I guarantee this thing peaks out at
450MHz (448.055, actually). GenuineIntel processor 0 family 6 model 8
stepping 1. Pentium III (Coppermine) with 256kb of cache.

While I'm not calling you a liar, I am saying that I'm not imagining it.
This could be an HP 'special' where they took a 500 and ran it at 450.
Or any other such thing. If it's not using SpeedStep, I'm not sure what
it is using.

My current method of speed changing is to reboot the laptop with the AC
plugged in for "high" mode, and unplugged for "low" mode. Once booted,
it doesn't seem to change modes.

> There is no one which is _supposed_ to change. It's just that GPO #0 is the
> most _common_ to change. However, you really should try the speedstep-smi
> module first.

I'll retry it a little later tonight, but as I recall, neither
speedstep-smi nor speedstep-ich (which i tried just to see if it was me
being stupid) worked, and complained about some very odd things.

> Even though I now own a wonderful centrino notebook, me and many others 
> still work on the various "earlier" speedstep drivers. So be a bit more 
> careful what you say, please.

I apologize.

~Gibby
